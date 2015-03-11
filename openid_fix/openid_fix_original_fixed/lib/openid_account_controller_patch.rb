require_dependency 'account_controller'

module OpenidAccountControllerPatch

    def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
            unloadable

            alias_method :open_id_authenticate, :fixed_open_id_authenticate
        end
    end

    module ClassMethods
    end

    module InstanceMethods

        OPENID_AX_EMAIL     = 'http://axschema.org/contact/email'
        OPENID_AX_FIRSTNAME = 'http://axschema.org/namePerson/first'
        OPENID_AX_LASTNAME  = 'http://axschema.org/namePerson/last'
        OPENID_AX_LANGUAGE  = 'http://axschema.org/pref/language'

        # Original function
        #def open_id_authenticate(openid_url)
        #    back_url = signin_url(:autologin => params[:autologin])
        #    authenticate_with_open_id(
        #        openid_url, :required => [ :nickname, :fullname, :email ],
        #        :return_to => back_url, :method => :post) do |result, identity_url, registration|
        #        if result.successful?
        #            user = User.find_or_initialize_by_identity_url(identity_url)
        #            if user.new_record?
        #                redirect_to(home_url) && return unless Setting.self_registration?
        #
        #                user.login = registration['nickname'] unless registration['nickname'].nil?
        #                user.mail = registration['email'] unless registration['email'].nil?
        #                user.firstname, user.lastname = registration['fullname'].split(' ') unless registration['fullname'].nil?
        #                user.random_password
        #                user.register
        #
        #                case Setting.self_registration
        #                when '1'
        #                    register_by_email_activation(user) do
        #                        onthefly_creation_failed(user)
        #                    end
        #                when '3'
        #                    register_automatically(user) do
        #                        onthefly_creation_failed(user)
        #                    end
        #                else
        #                    register_manually_by_administrator(user) do
        #                        onthefly_creation_failed(user)
        #                    end
        #                end
        #            else
        #                if user.active?
        #                    successful_authentication(user)
        #                else
        #                    handle_inactive_user(user)
        #                end
        #            end
        #        end
        #    end
        #end

        def fixed_open_id_authenticate(openid_url)
            settings = Setting.plugin_openid_fix

            # Verify the provided URL
            unless openid_url.nil? || !settings[:url_verification] || OpenidSource.match(openid_url)
                Rails.logger.error "Restricting access to OpenID URL: #{openid_url}"
                flash.now[:error] = l(:notice_invalid_openid_source)
                return
            end

            options = [ :nickname, :fullname, :email ]

            # Google OpenID
            options << OPENID_AX_EMAIL     # mail
            options << OPENID_AX_FIRSTNAME # firstname
            options << OPENID_AX_LASTNAME  # lastname
            options << OPENID_AX_LANGUAGE  # language

            back_url = signin_url(:autologin => params[:autologin])

            authenticate_with_open_id(openid_url, :required  => options,
                                                  :return_to => back_url,
                                                  :method    => :post) do |result, identity_url, registration|
                if result.successful?
                    # Now also check the user's identity URL
                    unless !settings[:url_verification] || OpenidSource.match(identity_url)
                        Rails.logger.error "Restricting access for OpenID identity URL: #{identity_url}"
                        flash.now[:error] = l(:notice_invalid_openid_source)
                        return
                    end

                    user = User.find_or_initialize_by_identity_url(identity_url)
                    if user.new_record?
                        redirect_to(home_url) && return unless Setting.self_registration?

                        if Rails::VERSION::MAJOR >= 3
                            ax_registration = OpenID::AX::FetchResponse.from_success_response(request.env[Rack::OpenID::RESPONSE])
                        else
                            ax_registration = registration
                        end

                        if ax_registration[OPENID_AX_EMAIL]
                            user.login = ax_registration[OPENID_AX_EMAIL].first
                            user.mail = ax_registration[OPENID_AX_EMAIL].first
                        else
                            user.login = registration['nickname'] unless registration['nickname'].nil?
                            user.mail = registration['email'] unless registration['email'].nil?
                        end
                        user.firstname, user.lastname = registration['fullname'].split(' ') unless registration['fullname'].nil?
                        if ax_registration[OPENID_AX_FIRSTNAME]
                            user.firstname = ax_registration[OPENID_AX_FIRSTNAME].first
                        end
                        if ax_registration[OPENID_AX_LASTNAME]
                            user.lastname = ax_registration[OPENID_AX_LASTNAME].first
                        end
                        if ax_registration[OPENID_AX_LANGUAGE]
                            lang = ax_registration[OPENID_AX_LANGUAGE].first
                            if lang
                                language = find_language(lang) || find_language(lang.split('-').first)
                                if language
                                    user.language = language.to_s
                                    set_language_if_valid(language)
                                end
                            end
                        end
                        user.random_password
                        user.register

                        if settings[:self_registration].nil?
                            self_registration = Setting.self_registration == '2' ? '2' : '3'
                        elsif settings[:self_registration].empty?
                            self_registration = Setting.self_registration
                        else
                            self_registration = settings[:self_registration]
                        end

                        case self_registration
                        when '1'
                            register_by_email_activation(user) do
                                onthefly_creation_failed(user)
                            end
                        when '3'
                            register_automatically(user) do
                                onthefly_creation_failed(user)
                            end
                        else
                            register_manually_by_administrator(user) do
                                onthefly_creation_failed(user)
                            end
                        end
                    else
                        if user.active?
                            successful_authentication(user)
                        elsif respond_to?(:handle_inactive_user)
                            handle_inactive_user(user)
                        else
                            account_pending
                        end
                    end
                else
                    response = request.env[Rack::OpenID::RESPONSE]
                    if response.status == OpenID::Consumer::FAILURE
                        Rails.logger.error "OpenID authentication failed: #{response.message}"
                    end
                end
            end
        end

    end

end

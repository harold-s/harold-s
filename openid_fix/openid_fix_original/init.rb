require 'redmine'

require_dependency 'openid_hook'

Rails.logger.info 'Starting OpenID Fix plugin for Redmine'

Rails.configuration.to_prepare do
    unless AccountController.included_modules.include?(OpenidAccountControllerPatch)
        AccountController.send(:include, OpenidAccountControllerPatch)
    end
end

Redmine::Plugin.register :openid_fix do
    name 'OpenID Fix'
    author 'Andriy Lesyuk'
    author_url 'http://www.andriylesyuk.com'
    description 'Plugin fixing OpenID authentication in Redmine.'
    url 'http://projects.andriylesyuk.com/projects/openid-fix'
    version '0.2.0'

    menu :admin_menu, :openid_authentication,
                    { :controller => 'openid_sources', :action => 'index' },
                      :html => { :class => 'server_authentication' },
                      :after => :ldap_authentication,
                      :if => Proc.new { Setting.openid? && Setting.plugin_openid_fix[:url_verification] }

    settings :default => {
        :self_registration => nil,
        :url_verification  => true
    }, :partial => 'settings/openid_fix'
end

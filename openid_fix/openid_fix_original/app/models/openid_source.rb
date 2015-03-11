class OpenidSource < ActiveRecord::Base
    NAME_MAX_LENGTH = 60

    validates_presence_of :name, :url
    validates_length_of :name, :in => 1..NAME_MAX_LENGTH
    validates_format_of :url, :with => %r{^https?://}i

    if Rails::VERSION::MAJOR < 3
        named_scope :active, { :conditions => { :active => true } }
    else
        scope :active, { :conditions => { :active => true } }
    end

    def users
        User.all(:conditions => [ "#{User.table_name}.identity_url LIKE :openid_url", { :openid_url => url_pattern } ])
    end

    def url_pattern
        url.gsub(%r{^https?://}, 'http%://').gsub(%r{\*}, '%').gsub(%r{([^%])/?$}, '\\1%')
    end

    def url_regexp
        url_regex = Regexp.escape(url)
        url_regex.gsub!(%r{^https?://}i, 'https?://')
        url_regex.gsub!(%r{\\\*}, '[^/]+')
        url_regex.gsub!(%r{/$}, '/?')
        url_regex + (url =~ %r{\?.+} ? '(?:&.*)?' : '(?:\?.*)?')
    end

    def match(openid_url)
        openid_url =~ %r{^#{url_regexp}$}
    end

    def self.match(openid_url)
        active.detect{ |source| source.match(openid_url) }
    end

end

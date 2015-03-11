# encoding: utf-8

class PopulateOpenidSources < ActiveRecord::Migration

    def self.up
        OpenidSource.create(:name => 'Google',         :url => 'https://www.google.com/accounts/o8/id', :active => true)
        OpenidSource.create(:name => 'Yahoo',          :url => 'http://me.yahoo.com/', :active => true)
        OpenidSource.create(:name => 'AOL',            :url => 'http://openid.aol.com/*', :active => true)
        OpenidSource.create(:name => 'MyOpenID',       :url => 'http://*.myopenid.com/', :active => true)
        OpenidSource.create(:name => 'LiveJournal',    :url => 'http://*.livejournal.com/', :active => true)
        OpenidSource.create(:name => 'WordPress',      :url => 'http://*.wordpress.com/', :active => true)
        OpenidSource.create(:name => 'Blogger',        :url => 'http://*.blogspot.com/', :active => true)
        OpenidSource.create(:name => 'Verisign',       :url => 'http://*.pip.verisignlabs.com/', :active => true)
        OpenidSource.create(:name => 'Launchpad',      :url => 'https://launchpad.net/~*', :active => true)
        OpenidSource.create(:name => 'ClaimID',        :url => 'http://claimid.com/*', :active => true)
        OpenidSource.create(:name => 'ClickPass',      :url => 'http://clickpass.com/public/*', :active => true)
        OpenidSource.create(:name => 'Google Profile', :url => 'http://www.google.com/profiles/*', :active => true)

        OpenidSource.create(:name => 'Яндекс',         :url => 'http://openid.yandex.ru', :active => true)
        OpenidSource.create(:name => 'Рамблер',        :url => 'http://www.rambler.ru', :active => true)
    end

    def self.down
        OpenidSource.find_by_url('https://www.google.com/accounts/o8/id').destroy
        OpenidSource.find_by_url('http://me.yahoo.com/').destroy
        OpenidSource.find_by_url('http://openid.aol.com/*').destroy
        OpenidSource.find_by_url('http://*.myopenid.com/').destroy
        OpenidSource.find_by_url('http://*.livejournal.com/').destroy
        OpenidSource.find_by_url('http://*.wordpress.com/').destroy
        OpenidSource.find_by_url('http://*.blogspot.com/').destroy
        OpenidSource.find_by_url('http://*.pip.verisignlabs.com/').destroy
        OpenidSource.find_by_url('https://launchpad.net/~*').destroy
        OpenidSource.find_by_url('http://claimid.com/*').destroy
        OpenidSource.find_by_url('http://clickpass.com/public/*').destroy
        OpenidSource.find_by_url('http://www.google.com/profiles/*').destroy

        OpenidSource.find_by_url('http://openid.yandex.ru').destroy
        OpenidSource.find_by_url('http://www.rambler.ru').destroy

    end

end

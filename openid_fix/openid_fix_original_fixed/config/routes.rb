if Rails::VERSION::MAJOR < 3

    ActionController::Routing::Routes.draw do |map|
        map.connect('openid_sources',          :controller => 'openid_sources', :action => 'index')
        map.connect('openid_sources/new',      :controller => 'openid_sources', :action => 'new')
        map.connect('openid_sources/create',   :controller => 'openid_sources', :action => 'create',  :conditions => { :method => :post })
        map.connect('openid_sources/:id/edit', :controller => 'openid_sources', :action => 'edit')
        map.connect('openid_sources/:id',      :controller => 'openid_sources', :action => 'update',  :conditions => { :method => :put })
        map.connect('openid_sources/:id',      :controller => 'openid_sources', :action => 'destroy', :conditions => { :method => :delete })
    end

else

    match('openid_sources',          :to => 'openid_sources#index', via: [:get, :post])
    match('openid_sources/new',      :to => 'openid_sources#new', via: [:get, :post])
    post('openid_sources/create',    :to => 'openid_sources#create')
    match('openid_sources/:id/edit', :to => 'openid_sources#edit', via: [:get, :post])
    put('openid_sources/:id',        :to => 'openid_sources#update')
    delete('openid_sources/:id',     :to => 'openid_sources#destroy')

end

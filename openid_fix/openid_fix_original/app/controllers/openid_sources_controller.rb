class OpenidSourcesController < ApplicationController
    layout 'admin'
    model_object OpenidSource
    menu_item :openid_authentication

    before_filter :find_model_object, :except => [ :index, :new, :create ]
    before_filter :require_admin

    def index
        @openid_sources = OpenidSource.all(:order => :name) || []
    end

    def new
        @openid_source = OpenidSource.new(:active => true)
    end

    def create
        @openid_source = OpenidSource.new(params[:openid_source])
        if @openid_source.save
            flash[:notice] = l(:notice_successful_create)
            redirect_to(:action => 'index')
        else
            render(:action => 'new')
        end
    end

    def edit
    end

    def update
        if @openid_source.update_attributes(params[:openid_source])
            flash[:notice] = l(:notice_successful_update)
            redirect_to(:action => 'index')
        else
            render(:action => 'edit')
        end
    end

    def destroy
        if @openid_source.destroy
            flash[:notice] = l(:notice_successful_delete)
        end
        redirect_to(:action => 'index')
    end

end

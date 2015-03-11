class OpenidHook  < Redmine::Hook::ViewListener

    def view_layouts_base_html_head(context = {})
        stylesheet_link_tag('openid', :plugin => 'openid_fix')
    end

end

class CreateOpenidSources < ActiveRecord::Migration

    def self.up
        create_table :openid_sources do |t|
            t.column :name,   :string,  :null => false, :limit => 60
            t.column :url,    :string,  :null => false
            t.column :active, :boolean, :null => false, :default => false
        end
    end

    def self.down
        drop_table :openid_sources
    end

end

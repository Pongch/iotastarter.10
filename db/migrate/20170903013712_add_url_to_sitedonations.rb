class AddUrlToSitedonations < ActiveRecord::Migration[5.1]
  def change
    add_column :sitedonations, :url, :string
  end
end

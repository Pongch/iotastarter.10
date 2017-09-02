class AddUrlToDonation < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :url, :string
  end
end

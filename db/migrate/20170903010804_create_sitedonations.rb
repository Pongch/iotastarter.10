class CreateSitedonations < ActiveRecord::Migration[5.1]
  def change
    create_table :sitedonations do |t|
      t.string :name
      t.integer :amount
      t.string :email
      t.string :tag

      t.timestamps
    end
  end
end

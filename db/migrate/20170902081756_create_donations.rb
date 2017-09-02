class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    drop_table :donations, force: :cascade
    create_table :donations do |t|
      t.string :name
      t.integer :amount
      t.string :email
      t.string :tag
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end

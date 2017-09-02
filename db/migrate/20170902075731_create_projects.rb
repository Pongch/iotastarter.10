class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    drop_table :projects, force: :cascade
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :owner
      t.integer :total
      t.string :category

      t.timestamps
    end
  end
end

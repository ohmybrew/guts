class CreateGutsGroups < ActiveRecord::Migration[4.2]
  def change
    create_table :guts_groups do |t|
      t.string :title
      t.string :slug

      t.timestamps null: false
    end
    
    add_index :guts_groups, :slug, unique: true
  end
end

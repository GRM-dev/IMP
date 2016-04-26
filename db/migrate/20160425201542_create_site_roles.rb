class CreateSiteRoles < ActiveRecord::Migration
  def change
    create_table :site_roles do |t|
      t.string :name, null: false, unique: true
      t.integer :rank, null: false, unique: true

      t.timestamps null: false
    end
  end
end

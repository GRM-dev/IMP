class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :shortname, null: false
      t.string :name, null: false, unique: true
      t.string :city
      t.string :street
      
      t.references :user, null: false, index: true, foreign_key: true
      t.references :dashboard, null: false, index: true, foreign_key: true
      t.references :company_type, null: false, index: true, foreign_key: true
      t.references :country, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, null: false, unique: true
      t.string :code, null: false, unique: true

      t.timestamps null: false
    end
  end
end

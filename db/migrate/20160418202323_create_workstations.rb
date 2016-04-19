class CreateWorkstations < ActiveRecord::Migration
  def change
    create_table :workstations do |t|
      t.string :name
      t.integer :number
      
      t.references :laboratory, index: true

      t.timestamps null: false
    end
  end
end

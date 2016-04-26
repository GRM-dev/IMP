class CreateWorkstations < ActiveRecord::Migration
  def change
    create_table :workstations do |t|
      t.string :name, null: false
      t.integer :number, null: false, default: 0
      
      t.references :laboratory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

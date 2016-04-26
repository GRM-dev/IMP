class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :name, null: false, unique: true
      t.integer :widgetscol, null: false, default: 0

      t.timestamps null: false
    end
  end
end

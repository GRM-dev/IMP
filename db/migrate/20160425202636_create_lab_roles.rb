class CreateLabRoles < ActiveRecord::Migration
  def change
    create_table :lab_roles do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end

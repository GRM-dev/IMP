class CreateDashboardRoles < ActiveRecord::Migration
  def change
    create_table :dashboard_roles do |t|
      t.string :name, null: false, unique: true
      t.integer :rank, null: false, unique: true

      t.timestamps null: false
    end
  end
end

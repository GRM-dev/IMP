class CreateDashboardPermissions < ActiveRecord::Migration
  def change
    create_table :dashboard_permissions do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end

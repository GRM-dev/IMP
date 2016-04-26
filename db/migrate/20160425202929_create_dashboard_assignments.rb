class CreateDashboardAssignments < ActiveRecord::Migration
  def change
    create_table :dashboard_assignments do |t|
      t.references :dashboards_id, null: false, index: true, foreign_key: true
      t.references :users_id, null: false, index: true, foreign_key: true
      t.references :dashboard_user_settings_id, null: false, index: true, foreign_key: true
      t.references :dashboard_roles_id, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

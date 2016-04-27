class CreateDashboardAssignments < ActiveRecord::Migration
  def change
    create_table :dashboard_assignments do |t|
      t.references :dashboard, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true
      t.references :dashboard_user_setting, null: false, index: true, foreign_key: true
      t.references :dashboard_role, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateDashboardAssignments < ActiveRecord::Migration
  def change
    create_table :dashboard_assignments do |t|
      t.references :dashboard, null: false, index: true, foreign_key: true
      t.references :dashboard_permission, null: false

      t.references :assignable, null: false, polymorphic: true, index: true

      t.references :dashboard_user_setting
      t.references :dashboard_role, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

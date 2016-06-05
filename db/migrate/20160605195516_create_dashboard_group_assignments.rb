class CreateDashboardGroupAssignments < ActiveRecord::Migration
  def change
    create_table :dashboard_group_assignments do |t|
      t.references :group, null: false, index: true, foreign_key: true
      t.references :dashboard_role, null: false, index: true, foreign_key: true
      t.references :dashboard, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

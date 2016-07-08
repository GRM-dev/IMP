class CreateLaboratoriesAssignments < ActiveRecord::Migration
  def change
    create_table :laboratories_assignments do |t|

      t.references :laboratory, null: false, index: true, foreign_key: true
      t.references :lab_role, null: false, index: true, foreign_key: true
      t.references :dashboard_permission, null: false

      t.integer :lab_assignable_id, null: false
      t.string :lab_assignable_type, null: false

      t.timestamps null: false
    end

    add_index :laboratories_assignments, [:lab_assignable_type, :lab_assignable_id], name: 'index_lab_assignments'
  end
end

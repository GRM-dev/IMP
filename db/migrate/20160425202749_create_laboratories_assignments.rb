class CreateLaboratoriesAssignments < ActiveRecord::Migration
  def change
    create_table :laboratories_assignments do |t|
      
      t.references :user, null: false, index: true, foreign_key: true
      t.references :laboratory, null: false, index: true, foreign_key: true
      t.references :lab_role, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

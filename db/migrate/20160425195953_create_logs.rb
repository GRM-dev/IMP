class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :log, null: false
      t.string :category, null: false, default: 'unknown'
      
      t.references :user, null: true, index: true, foreign_key: true
      t.references :log_type, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

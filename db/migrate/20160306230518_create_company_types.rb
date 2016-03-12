class CreateCompanyTypes < ActiveRecord::Migration
  def change
    create_table :company_types do |t|
      t.string :name, null: false, unique: true
      t.boolean :installed, null: false, default: false
      
      t.timestamps null: false
    end
  end
end

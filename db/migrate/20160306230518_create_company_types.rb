class CreateCompanyTypes < ActiveRecord::Migration
  def change
    create_table :company_types do |t|
      t.string :name, null: false, unique: true
      
      #t.timestamps null: false
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :visible_name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :first_name, null: true, unique: false
      t.string :last_name, null: true, unique: false
      t.datetime :age, null: true, unique: false
      t.string :password_digest, null: false
      t.datetime :last_login, default: Time.now, null: false
      t.string :last_ip, default: '0.0.0.0', null: false
      t.boolean :was_activated, null: false, default: false
      t.boolean :active, null: false, default: true
      
      t.references :site_role, null: false, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end

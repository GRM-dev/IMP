class CreateUsersAvatars < ActiveRecord::Migration
  def change
    create_table :users_avatars do |t|
      t.boolean :active, null: false, default: false
      
      t.references :user, null: false, index: true, foreign_key: true
      t.references :avatar, null: false, unique: true, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

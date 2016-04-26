class CreateUsersAvatars < ActiveRecord::Migration
  def change
    create_table :users_avatars do |t|
      t.boolean :active, null: false, default: false
      
      t.references :users_id, null: false, index: true, foreign_key: true
      t.references :avatars_id, null: false, unique: true, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

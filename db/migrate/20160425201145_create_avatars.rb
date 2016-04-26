class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :url, null: false, default: 'default_avatar.png'

      t.timestamps null: false
    end
  end
end

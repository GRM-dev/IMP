class CreateActiveWidgets < ActiveRecord::Migration
  def change
    create_table :active_widgets do |t|
      
      t.references :dashboard_user_setting, null: false, index: true, foreign_key: true
      t.references :widget, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

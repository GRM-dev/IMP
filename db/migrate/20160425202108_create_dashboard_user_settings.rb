class CreateDashboardUserSettings < ActiveRecord::Migration
  def change
    create_table :dashboard_user_settings do |t|

      t.timestamps null: false
    end
  end
end

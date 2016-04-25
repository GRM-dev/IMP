class CreateLogTypes < ActiveRecord::Migration
  def change
    create_table :log_types do |t|
      t.string :name, null: false, unique: true
      t.integer :rank, null: false, unique: true

      t.timestamps null: false
    end
    
    LogType.create(name:"Trace", rank:1)
    LogType.create(name:"Info", rank:2)
    LogType.create(name:"Warning", rank:3)
    LogType.create(name:"Error", rank:4)
  end
end

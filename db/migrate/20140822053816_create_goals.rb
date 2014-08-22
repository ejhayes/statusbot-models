class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :user
      t.string :description, :null => false
      t.datetime :start_time, :null => false
      t.datetime :stop_time

      t.timestamps
    end

    add_foreign_key :goals, :users, :dependent => :delete
  end
end

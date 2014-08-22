class CreateWaits < ActiveRecord::Migration
  def change
    create_table :waits do |t|
      t.references :user
      t.string :description, :null => false

      t.timestamps
    end

    add_foreign_key :waits, :users, :dependent => :delete
  end
end

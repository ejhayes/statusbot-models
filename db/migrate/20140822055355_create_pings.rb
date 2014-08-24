class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.references :wait
      t.string :description

      t.timestamps
    end

    add_foreign_key :pings, :waits, :dependent => :delete
  end
end

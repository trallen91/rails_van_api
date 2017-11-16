class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
          t.decimal  "pickup_latitude",   precision: 10, scale: 6
          t.decimal  "pickup_longitude",  precision: 10, scale: 6
          t.boolean  "complete",   default: false
          t.datetime "created_at",                 null: false
          t.datetime "updated_at",                 null: false
          t.timestamps null: false
    end
  end
end
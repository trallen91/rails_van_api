class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
          t.decimal  "pickup_latitude",   precision: 10, scale: 6
          t.decimal  "pickup_longitude",  precision: 10, scale: 6
          t.string  "status",   default: "Waiting"
          t.datetime "created_at",                 null: false
          t.datetime "updated_at",                 null: false
          t.string "hailer_phone_number"
          t.decimal  "destination_latitude",   precision: 10, scale: 6
          t.decimal  "destination_longitude",  precision: 10, scale: 6
          t.timestamps null: false
    end
  end
end
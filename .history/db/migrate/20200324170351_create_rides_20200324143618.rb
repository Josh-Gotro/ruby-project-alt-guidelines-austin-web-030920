class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :ride_status
      t.string :passenger_zip
      t.integer :driver_id
      t.integer :passenger_id
    end
  end
end

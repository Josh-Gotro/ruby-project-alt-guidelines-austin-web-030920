class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.datetime :time_of_ride
      t.integer :zip_code
    end
  end
end

class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.datetime :visit_time
      t.integer :passenger_id
      t.integer :service_id
      t.integer :ride_id
    end
  end
end

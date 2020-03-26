class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :referral_type
      t.string :primary_service
      t.string :location_name
      t.integer :zip_code
      t.string :address
      t.string :web_address
    end
  end
end
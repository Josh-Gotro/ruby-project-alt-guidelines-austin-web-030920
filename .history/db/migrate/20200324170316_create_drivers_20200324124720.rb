class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.boolean :online?
      t.integer :zip_code
    end
  end
end

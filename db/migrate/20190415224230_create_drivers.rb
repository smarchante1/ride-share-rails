class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :vin
      t.boolean :active
      t.string :car_make
      t.string :car_model

      t.timestamps
    end
  end
end

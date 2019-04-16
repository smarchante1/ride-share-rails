class UpdateForeignKeyToCascade < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :trips, :drivers
    remove_foreign_key :trips, :passengers
  end
end

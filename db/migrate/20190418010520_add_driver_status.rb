class AddDriverStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :status, :boolean, default: true
  end
end

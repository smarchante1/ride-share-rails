class AddCascadeToForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :trips, :drivers, on_delete: :cascade
    add_foreign_key :trips, :passengers, on_delete: :cascade
  end
end

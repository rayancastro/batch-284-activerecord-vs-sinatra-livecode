class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |table|
      table.string :name
      table.string :city
      table.timestamps
    end
  end
end

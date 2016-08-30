class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :postal_code
      t.decimal :price, precision: 12, scale: 2
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :livable_area_square_feet
      t.decimal :land_size_acres, precision: 8, scale: 2
      t.string :title
      t.text :description
      t.string :property_type
      t.text :features
      t.decimal :latitude, precision: 9, scale: 7
      t.decimal :longitude, precision: 9, scale: 7

      t.timestamps
    end
  end
end

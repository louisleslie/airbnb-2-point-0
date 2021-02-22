class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :property_type
      t.integer :total_occupancy
      t.integer :total_bedrooms
      t.integer :total_bathrooms
      t.text :summary
      t.float :price_per_night
      t.boolean :has_tv
      t.boolean :has_kitchen
      t.boolean :has_aircon
      t.boolean :has_heating
      t.boolean :has_internet
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

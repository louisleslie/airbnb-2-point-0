class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.float :total_cost
      t.float :price_per_night
      t.integer :number_of_guests
      t.string :status

      t.timestamps
    end
  end
end

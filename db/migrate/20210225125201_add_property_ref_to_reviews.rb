class AddPropertyRefToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :property, null: false, foreign_key: true
  end
end

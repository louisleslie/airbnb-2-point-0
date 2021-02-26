class Property < ApplicationRecord
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  geocoded_by :address
  validates :name, presence: true
  validates :property_type, presence: true
  validates :total_occupancy, presence: true, numericality: { only_integer: true }
  validates :summary, presence: true
  validates :price_per_night, presence: true, numericality: { only_float: true }
  validates :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates :start_date, presence: true, numericality: { greater_than_or_equal_to: Date.today.to_f }
  validates :end_date, presence: true, numericality: { greater_than: :start_date.to_f }
  validates :number_of_guests, presence: true, numericality: { less_than_or_equal_to: :property.total_occupancy }
  validates :status, inclusion: { in: %w(Pending Approved Declined), message: "%{value} is not a valid value" }, allow_nil: true
end

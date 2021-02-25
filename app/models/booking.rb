class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property
  has_many :reviews
  validates :number_of_guests, presence: true # , numericality: { less_than_or_equal_to: :property.total_occupancy }
  validates :status, inclusion: { in: %w(Pending Approved Declined), message: "%{value} is not a valid value" }, allow_nil: true
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end

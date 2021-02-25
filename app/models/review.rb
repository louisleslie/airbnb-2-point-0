class Review < ApplicationRecord
  belongs_to :booking
  belong_to :property
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  
  def errormessage
    if content.blank? || rating.blank?
      errors.add(:content, :rating "please make sure you completed the form correctly.")
  end
end

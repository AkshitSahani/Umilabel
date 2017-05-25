class Pledge < ApplicationRecord
  belongs_to :reward
  belongs_to :user

  validates :percentage_pledged, numericality: {greater_than: 0}
  validate :pledge_less_than_or_equal_to_offering

  private

  def pledge_less_than_or_equal_to_offering
    if self.percentage_pledged > self.reward.percentage
      errors.add(:shares, 'cannot be allocated for a larger value than that is offered!')
    end
  end
end

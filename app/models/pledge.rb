class Pledge < ApplicationRecord
  belongs_to :reward
  belongs_to :user

  validates :percentage_pledged, numericality: {greater_than: 0}
end

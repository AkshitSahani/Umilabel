class Reward < ApplicationRecord
  belongs_to :campaign
  has_many :pledges
  has_many :backers, through: :pledges, source: :user

  validates :client, :percentage, presence: true
  validates :percentage, numericality: {greater_than: 0}
end

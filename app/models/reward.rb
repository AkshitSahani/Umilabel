class Reward < ApplicationRecord
  belongs_to :campaign
  has_many :backers, through: :pledges, source: :User
  has_many :pledges
end

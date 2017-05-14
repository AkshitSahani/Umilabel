class Reward < ApplicationRecord
  belongs_to :campaign
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
end

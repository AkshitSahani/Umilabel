class Reward < ApplicationRecord
  belongs_to :campaign
  has_many :pledges
  has_many :backers, through: :pledges, source: :user

  validates :client, :percentage, presence: true
  validate :umilabel_cost

   def umilabel_cost
     if self.campaign.rewards.sum(:percentage) > 92
       errors.add(:rewards, 'can only be for 92% of the shares. 8% are Umilabel offering costs')
     end
   end
end

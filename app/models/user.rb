class User < ApplicationRecord
  has_many :subscribed_tos, class_name: "User"
  has_many :subscribees, class_name: "User"
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :campaigns
end

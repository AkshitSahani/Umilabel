class Campaign < ApplicationRecord
  has_many :rewards
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :backers, through: :rewards
  has_many :pledges, through: :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true
end

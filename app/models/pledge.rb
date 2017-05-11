class Pledge < ApplicationRecord
  belongs_to :reward
  belongs_to :campaign, through: :reward
  belongs_to :user
end

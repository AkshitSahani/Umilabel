class Subscription < ApplicationRecord
  belongs_to :subscribee, class_name: "User", foreign_key: "subscribee_id"
  belongs_to :subscribed_to, class_name: "User", foreign_key: "subscribed_to_id"
end

class Campaign < ApplicationRecord
  has_many :rewards
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :backers, through: :rewards
  has_many :pledges, through: :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-2.amazonaws.com/abett-static/default-avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_attached_file :background_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-2.amazonaws.com/abett-static/default-avatar.jpg"
  validates_attachment_content_type :background_image, content_type: /\Aimage\/.*\z/

  def self.search(search)
    Campaign.where("title LIKE ?", "%#{search}%")
  end
end

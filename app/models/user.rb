class User < ApplicationRecord
  has_secure_password
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-2.amazonaws.com/abett-static/default-avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_attached_file :background_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-2.amazonaws.com/abett-static/default-avatar.jpg"
  validates_attachment_content_type :background_image, content_type: /\Aimage\/.*\z/

  has_many :subscribed_tos, class_name: "User"
  has_many :subscribees, class_name: "User"
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :campaigns

  def self.search(search)
    User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR username LIKE ? OR studio_name LIKE ? OR tags LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end

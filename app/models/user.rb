class User < ApplicationRecord
  has_secure_password
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-2.amazonaws.com/abett-static/default-avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_attached_file :background_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-2.amazonaws.com/abett-static/default-avatar.jpg"
  validates_attachment_content_type :background_image, content_type: /\Aimage\/.*\z/

  has_many :subscribed_tos, class_name: "Subscription", foreign_key: "subscribee_id"
  has_many :subscribees, class_name: "Subscription", foreign_key: 'subscribed_to_id'
  has_many :authored_conversations, class_name: "Conversation", foreign_key: 'author_id'
  has_many :received_conversations, class_name: "Conversation", foreign_key: 'receiver_id'
  has_many :sent_personal_messages, class_name: "PersonalMessage", foreign_key: 'author_id', dependent: :destroy
  has_many :received_personal_messages, class_name: "PersonalMessage", foreign_key: 'receiver_id', dependent: :destroy


  has_many :pledges
  has_many :rewards, :through => :pledges
  has_many :owned_campaigns, class_name: "Campaign", foreign_key: 'owner_id'
  has_many :backed_campaigns, :through => :rewards, source: :campaign

  def self.search(search)
    User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR username LIKE ? OR studio_name LIKE ? OR tags LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def self.split_tags(tags)
    array = tags.split(',')
    return array
  end

  validates :first_name, :last_name, :email, :username, presence: true
  validates :password, length: {in: 6..20}, confirmation: true
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}, :uniqueness => {:case_sensitive => false}

end

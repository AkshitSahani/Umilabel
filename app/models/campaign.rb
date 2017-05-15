class Campaign < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :rewards, inverse_of: :campaign
  has_many :pledges, through: :rewards
  has_many :backers, through: :pledges, source: :user

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-2.amazonaws.com/abett-static/default-avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_attached_file :background_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-2.amazonaws.com/abett-static/default-avatar.jpg"
  validates_attachment_content_type :background_image, content_type: /\Aimage\/.*\z/

  has_attached_file :album_cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-2.amazonaws.com/abett-static/default-avatar.jpg"
  validates_attachment_content_type :album_cover, content_type: /\Aimage\/.*\z/

  has_attached_file :document_1, styles: {thumbnail: "60x60#"}
  validates_attachment :document_1, content_type: { content_type: "application/pdf" }

  has_attached_file :document_2, styles: {thumbnail: "60x60#"}
  validates_attachment :document_2, content_type: { content_type: "application/pdf" }

  has_attached_file :document_3, styles: {thumbnail: "60x60#"}
  validates_attachment :document_3, content_type: { content_type: "application/pdf" }

  def self.search(search)
    Campaign.where("title LIKE ?", "%#{search}%")
  end

  def self.youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    %Q{<iframe title="YouTube video player" width="640" height="400" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
  end

end

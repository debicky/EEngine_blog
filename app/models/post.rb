class Post < ApplicationRecord
  before_save :publish_post
  
  has_many :comments

  belongs_to :author
  validates :title, length: { minimum: 5}, presence: true
  validates :body, length: { minimum: 15}, presence: true

  scope :approved_posts, -> { where(published: true) }
  scope :unapproved_posts, -> { where(published: false) }

  extend FriendlyId
  friendly_id :title, use: :slugged


  def publish_post
    if self.published == true
      self.published_at = Time.now
    end
  end
end

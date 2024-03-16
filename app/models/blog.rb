class Blog < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  has_many :likes, as: :likeable
  # associations 
  has_and_belongs_to_many :categories

  has_one_attached :cover_image

  def cover_image_url 
    rails_blob_url(self.cover_image, only_path: false) if self.cover_image.attached?
  end

  def liked?(user) 
    self.likes.where(user: user).exists?
  end

end
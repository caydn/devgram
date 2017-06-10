class Post < ApplicationRecord
  validates :user_id, presence: true
  validates_presence_of :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, PhotoUploader
end

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :post

  mount_uploader :image, ImagesUploader
  validates :text, presence: true
end

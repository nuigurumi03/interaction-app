class Post < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  
end

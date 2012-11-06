class Post < ActiveRecord::Base
  attr_accessible :image, :question

  belongs_to :user
  validates :user_id, presence: true
	mount_uploader :image, ImageUploader

	validates :question, presence: true, length: { maximum: 140 }
	validates :image, presence: true
  	validates :user_id, presence: true


default_scope :order => 'posts.created_at DESC'
end

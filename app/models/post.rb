class Post < ActiveRecord::Base
  attr_accessible :image, :question

  belongs_to :user
  has_many :comments

  	validates :user_id, presence: true
	validates :question, presence: true, length: { maximum: 140 }
	validates :image, presence: true

	mount_uploader :image, ImageUploader
  	
self.per_page = 10

default_scope order: 'posts.created_at DESC'
scope :from_all_users, lambda { |user| followed_by(user) }

private

def self.from_all_users(user)
    all_user_ids = "SELECT id FROM users"
    where("user_id IN (#{all_user_ids}) OR user_id = ?", 
          user_id: user.id)
 end


end

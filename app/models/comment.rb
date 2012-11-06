class Comment < ActiveRecord::Base
  attr_accessible :comm

belongs_to :user
belongs_to :post

self.per_page = 10

validates :comm, presence: true, length: { maximum: 100 }
	validates :post_id, presence: true
  	validates :user_id, presence: true

default_scope order: 'comments.created_at DESC'

end

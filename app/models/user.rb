class User < ActiveRecord::Base
  attr_accessible :email, :name

  before_save { self.email.downcase }  # сохраняем емэйл в нижнем регистре перед сохранением в БД ()

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false} 

  def self.authenticate(email)
  	user = find_by_email(email)
  	if user.nil? 
  		nil
  	else
  		user
  	end
  end

end

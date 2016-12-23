class User < ActiveRecord::Base
    has_many :articles
    before_save {self.email = email.downcase }
    validates :username, presence: true, 
              uniqueness: {case_sensitive: false}, 
              length: {minimum: 8, maximum: 25}
    
    VALID_EMAIL_REGEX = /\A[w+\-.]+@[a-z\d\-.]+\z/i
    validates :email, presence: true, 
              uniqueness: true,
              length: {maximum:105},
              format: {with: VALID_EMAIL_REGEX }
              
    validates :user_id, presence: true
end
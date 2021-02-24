class User < ApplicationRecord
    has_many :posts
    has_many :posts, through: :comments
    has_many :comments, through: :posts
    has_many :topics, through: :posts
    
    validates :user_name, :first_name, :last_name, :affected_person, :email, :location, presence: true
end

class User < ApplicationRecord
    has_secure_password

    has_many :posts, dependent: :destroy
    has_many :posts, through: :comments
    has_many :comments, through: :posts, dependent: :destroy
    has_many :topics, through: :posts
    
    validates :user_name, :first_name, :last_name, :affected_person, :email, :location, presence: true
    validates :email, :user_name, uniqueness: true
end

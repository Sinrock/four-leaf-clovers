class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :posts, through: :comments
    has_many :comments, through: :posts, dependent: :destroy
    has_many :topics, through: :posts
    has_secure_password
    validates :user_name, :first_name, :last_name, :affected_person, :email, :location, presence: true
    validates :email, uniqueness: true
end

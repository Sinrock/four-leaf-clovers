class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    has_secure_password

    has_many :posts, dependent: :destroy
    has_many :topics, dependent: :destroy

    has_many :comments, dependent: :destroy
    #has_many :commented_posts, :through => :comments, source: :post
    
    
    validates :user_name, :first_name, :last_name, :affected_person, :email, :location, presence: true
    validates :email, :user_name, uniqueness: true
end

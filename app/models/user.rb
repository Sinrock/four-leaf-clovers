class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
         
    has_secure_password

    has_many :posts, dependent: :destroy
    has_many :topics, dependent: :destroy

    has_many :comments, dependent: :destroy
    #has_many :commented_posts, :through => :comments, source: :post
    
    
    validates :user_name, :first_name, :last_name, :email, presence: true
    validates :email, :user_name, uniqueness: true


    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end    

    @user = User.from_omniauth(request.env['omniauth.auth'])
end
end

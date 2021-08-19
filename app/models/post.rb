class Post < ApplicationRecord
    belongs_to :user
    belongs_to :topic
    
    has_many :comments
    has_many :users, :through => :comments, source: :user_id

    validates :title, :body, presence: true

    
end

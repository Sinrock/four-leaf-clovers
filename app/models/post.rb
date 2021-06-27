class Post < ApplicationRecord
    belongs_to :user
    belongs_to :topic
    
    has_many :comments
    has_many :users, :through => :comments

    
    #has_many :topics, :through => :post_topics

    validates :title, :body, presence: true
end

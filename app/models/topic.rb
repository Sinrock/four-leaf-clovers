class Topic < ApplicationRecord
    has_many :post_topics
    has_many :posts, :through => :post_topics
    has_many :users, :through => :posts

    validates :title, presence: true, uniqueness: true
    
        def topics_count
            topics.count
        end
end

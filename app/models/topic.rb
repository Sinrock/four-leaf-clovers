class Topic < ApplicationRecord
    has_many :posts
    validates :title, presence: true
    
        def topics_count
            topics.count
        end
end

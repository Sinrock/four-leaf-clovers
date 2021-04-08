class Topic < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts
    validates :title, presence: true
    
        def topics_count
            topics.count
        end
end

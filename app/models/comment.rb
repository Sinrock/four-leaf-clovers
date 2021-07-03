class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    has_many :comments
    has_many :users, :through => :comments, source: :user_id
    
    validates :content, presence: true
end

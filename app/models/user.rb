class User < ApplicationRecord
    has_many :posts
    has_many :posts, through: :comments, source: : #need to add source
    has_many :comments, through: :posts
    #Need to add validations still
end

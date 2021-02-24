class Topic < ApplicationRecord
    belongs_to :post
    has_many :posts

    #Need to add validations still
end

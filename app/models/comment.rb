class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    #Need to add validations still
end

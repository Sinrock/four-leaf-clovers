class Post < ApplicationRecord
    belongs_to :user
    belongs_to :categories

    #Need to add validations still
end

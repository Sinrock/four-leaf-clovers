class Post < ApplicationRecord
    belongs_to :user
    belongs_to :topic

    #Need to add validations still
end

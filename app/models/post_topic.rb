class Post_Topic < ApplicationRecord
    belongs_to :post
    belongs_to :topic
end

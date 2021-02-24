class Post < ApplicationRecord
    belongs_to :user
    belongs_to :topic
    has_many :comments
    has_many :users, through: :comments  #has two sources to users for authored comments and comments

    validates :title, :body, presence: true
end

class Comment < ApplicationRecord
    has_many :post_comments
    has_many :posts, through: :post_comments
    belongs_to :user
end

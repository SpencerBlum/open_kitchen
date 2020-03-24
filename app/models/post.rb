class Post < ApplicationRecord
    has_many :post_comments
    has_many :comments, through: :post_comments
    belongs_to :restaurant

end

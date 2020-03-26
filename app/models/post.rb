class Post < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments
    belongs_to :restaurant

    # def total_count
    #     Post.all.count
    # end
end

class Post < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments
    belongs_to :restaurant

    has_many :likes
    has_many :users, through: :likes

    def self.total_count
        Post.all.count
    end
end

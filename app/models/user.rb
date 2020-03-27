class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :posts, through: :comments
    validates :email, uniqueness: true
    def name 
        first_name + ' ' + last_name 
    end

    def comment_by_user
        comments.count
    end
    
    def user_created
        created_at
    end
    
    
    def name_and_comments(user)
        "#{user.name} has #{user.comment_by_user} comments "
    end

    def restaurant_owner(user)
        if user.is_owner
        "#{user.name} is a owner "
        else
        "#{user.name} is not a owner"
        end
    end

    def account_created
        "User created account on #{created_at}"
    end

    def character_counts
        # comments.map do |comment|
        #     comment.character_counts
        # end.inject { |sum, n| sum + n } 
        
        comments.length > 0 ? comments.map do |comment|
            comment.character_counts
        end.inject { |sum, n| sum + n } : 0 
    
    end




    def character_count_avg
        # if comments && character_counts
        #     character_counts / comments.length
        # else
        #     0
        # end
        character_counts > 0 ? character_counts / comments.length : 0
    end
end

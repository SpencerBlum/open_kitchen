class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :posts, through: :comments
    validates :email, uniqueness: true
    has_many :likes
    has_many :posts, through: :likes
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
        #inject { |sum, n| sum + n } 

        sumArray = comments.map do |comment|
            comment.character_counts
            # puts comment.character_counts
        end
        
        sumArray.inject { |sum, n| sum + n } 

        # sum = 0
        # comments.each do |comment|
        #     sum = sum + comment.character_counts
        #     byebug
        # end  
        # sum

       
    end
    def likes?(post)

        post.likes.where(user_id: id).any?
      
      end
      
end

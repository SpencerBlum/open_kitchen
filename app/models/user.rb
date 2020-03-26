class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :posts, through: :comments
    validates :email, uniqueness: true
    def name 
        self.first_name + ' ' + self.last_name 
    end

    def comment_by_user
        self.comments.count
    end
    
    def user_created
        self.created_at
    end
    
    
    def name_and_comments(name)
        "#{name} has #{self.comment_by_user} comments "
    end

    def restaurant_owner(user)
        if user.is_owner
        "#{user.name} is a owner "
        else
        "#{user.name} is not a owner"
        end
    end

    def account_created
        "User created account on #{self.created_at}"
    end

    

    
end

class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :posts, through: :comments

    def name 
        self.first_name + ' ' + self.last_name 
    end

end

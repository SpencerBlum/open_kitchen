class User < ApplicationRecord
    has_secure_password
    has_many :comments

    def name 
        self.first_name + ' ' + self.last_name 
    end

end

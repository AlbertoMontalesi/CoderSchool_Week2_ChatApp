class User < ApplicationRecord
    validates :email, presence: true, uniqueness: {case_sensitive:false} #user name is not  case_sensitive
    has_secure_password  #method to load the brycpt gem 
    

    def incoming_messages
        Message.where(recipient_id: id)
    end

    def to_s
        email
    end
end

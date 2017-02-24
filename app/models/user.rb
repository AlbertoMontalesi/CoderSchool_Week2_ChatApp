class User < ApplicationRecord
    validates :email, presence: true, uniqueness: {case_sensitive:false} #user name is not  case_sensitive
    has_secure_password  #method to load the brycpt gem 
    

    def incoming_messages #message we received
        Message.where(recipient_id: id).order(created_at: :desc) #to display them in descending order 
    end

    def sent_messages #message we sent
        Message.where(sender_id: id)
    end

    def latest_incoming_messages(n)
        incoming_messages.order(created_at: :desc).limit(n) #change n with how many messages you want 
    end

    def unread_messages
        incoming_messages.unread #unread is defined in the message.rb
    end

    def to_s
        email
    end

end

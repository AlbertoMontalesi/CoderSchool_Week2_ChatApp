class Message < ApplicationRecord
    belongs_to :sender, class_name: 'User'
    belongs_to :recipient, class_name: 'User'

    def self.unread #where there is no read_at means that the message is still unread
        where(read_at: nil)
    end

    def mark_as_read!
        self.read_at = Time.now #to grab the time of reading
        save!
    end

    def read?
        read_at
    end


end

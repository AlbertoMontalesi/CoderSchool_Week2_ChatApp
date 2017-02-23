class MessagesController < ApplicationController

  before_action :require_user #if you use devise authenticate user will be already here

  def incoming
    @incoming_messages = current_user.incoming_messages
  end

  def new
    @message = Message.new

  end


  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :subject, :body)
  end
end

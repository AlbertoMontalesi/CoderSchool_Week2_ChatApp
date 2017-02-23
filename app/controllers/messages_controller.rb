class MessagesController < ApplicationController

  before_action :require_user #if you use devise authenticate user will be already here
  def index
      @message = Message.all
      
  end

  def incoming
    @incoming_messages = current_user.incoming_messages
  end

  def new
    @message = Message.new
  end

  def create  #still not working 
     @message = Message.new
  if @message.save
    redirect_to incoming_messages_path
  else
    render new_message_path
    flash[:success] = "Message was not sent "
  end
  end


  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :subject, :body)
  end
end

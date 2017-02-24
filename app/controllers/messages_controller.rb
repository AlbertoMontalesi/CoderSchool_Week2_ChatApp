class MessagesController < ApplicationController

  before_action :require_user #if you use devise authenticate user will be already here
 

  def incoming
    @incoming_messages = current_user.incoming_messages #defined in user
  end

  def sent
    @sent_messages = current_user.sent_messages
  end

  def new
    @message = Message.new
  end

  def show #to revisit
     @message = Message.find(params[:id])
     ##@message = Message.find(params[:id]).where(recipient: current_user)
      if @message.recipient == current_user #if the user views the message we mark it as read
        if @message.read?
          redirect_to incoming_messages_path
          flash[:error] = "You already read the message"
        else
        @message.mark_as_read! #if the user didnt previously see the message we mark it as read now       
      end
      end
  end

  def create  #still not working 
     @message = Message.new
  if @message.save
    redirect_to incoming_messages_path
  else
    render new_message_path
    flash[:error] = "Message was not sent "
  end
  end


  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :subject, :body)
  end
end

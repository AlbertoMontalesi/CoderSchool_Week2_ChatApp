class MessagesController < ApplicationController

  before_action :require_user #if you use devise authenticate user will be already here
 
  def create
    @message = Message.new message_params
    @message.sender = current_user
      if @message.save
        redirect_to incoming_messages_path
      else
        flash.now[:error] = @message.errors.full_messages.to_sentence
        render new_message_path
      end
  end

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

  


  private

  def message_params
    params.require(:message).permit(:recipient_id, :subject, :body)
  end
end

class MessagesController < ApplicationController

  def new
    @channel = Channel.find(params[:channel_id])
    @message = @channel.messages.new(notify: "#all")
    @message.documents.build
  end

  def create
    @channel = Channel.find(params[:channel_id])
    @message = Message.new(message_params.merge(
      channel: @channel,
      user: current_user
    ))
    @message.change_show! if @message.notify_all?
    save_message(@message, @channel)
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content, :identity, :notify,  :documents_attributes => [:name, :filetype, :file, :file_cache])
  end

  def notification_params
    params.require(:notification).permit(:addressee)
  end

  def save_message(message, channel)
    if message.save
      redirect_to channel, notify: "Message sent"
    else
     render :new
    end
  end
end


class MessagesController < ApplicationController
  def new
    @channel = Channel.find(params[:channel_id])
    @message = @channel.messages.new
  end

  def create
    @message = Message.new(message_params)
    @channel = Channel.find(params[:channel_id])
    @message.channel = @channel
    @message.user = current_user
    if @message.save
      redirect_to @channel
    else
      render :new
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content, :identity)
  end
end

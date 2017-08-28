class MessagesController < ApplicationController

  def new
    @channel = Channel.find(params[:channel_id])
    @message = @channel.messages.new
    @message.documents.build
  end

  def create
    @message = Message.new(message_params)
    @channel = Channel.find(params[:channel_id])
    @message.channel = @channel
    @message.user = current_user

    if message_params[:documents_attributes].first.second[:name].present?
      byebug
      if message_params[:documents_attributes].first.second[:filetype] == "notification"

      end
      if @message.save
          redirect_to @channel
      else
        render :new
      end
    else
      @message.documents.clear
      if @message.save
        redirect_to @channel
      else
       render :new
      end
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content, :identity, :documents_attributes => [:name, :filetype, :file, :file_cache])
  end

  def document_params
    message_params.require(:documents_attributes).permit(:name, :filetype, :file, :file_cache)
  end

  def notification_params
    params.require(:notification).permit(:addressee)
  end
end

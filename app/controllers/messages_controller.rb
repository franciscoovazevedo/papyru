class MessagesController < ApplicationController

  def new
    @channel = Channel.find(params[:channel_id])
    @message = @channel.messages.new
    @message.documents.build
  end

  def create
    @message = Message.new(message_params)
    if message_params[:documents_attributes].first.second[:name].present?
      @document = Document.new(name: message_params[:documents_attributes].first.second[:name])
      @message.documents << @document
    else
      @message.documents.clear
    end

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
    params.require(:message).permit(:content, :identity, :documents_attributes => [:name, :file_types])
  end

  def document_params
    message_params.require(:documents_attributes).permit(:name)
  end
end

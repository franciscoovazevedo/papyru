class ChannelsController < ApplicationController

  def show
    @channel = Channel.find(params[:id])
    @messages = @channel.messages.order(:created_at).reverse.first(3)
    @documents = @channel.documents
  end

end

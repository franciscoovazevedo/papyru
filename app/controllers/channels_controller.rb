class ChannelsController < ApplicationController
  def new
    @study = Study.find(params[:study_id])
    @channel = @study.channels.new
  end

  def create
    @channel = Channel.new(channel_params)
    @study = Study.find(params[:study_id])
    @channel.study = @study
    if @channel.save
      redirect_to @channel
    else
      render :new
    end
  end

  def show
    @channel = Channel.find(params[:id])
    @subject = @channel.subject.name
    @messages = @channel.messages.order(:created_at).reverse.first(3)
    @documents = @channel.documents
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end
end

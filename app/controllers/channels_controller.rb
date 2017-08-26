class ChannelsController < ApplicationController
  before_action :find_channel, only: [:show, :edit, :update, :destroy]
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
    @subject = @channel.subject.name
    @messages = @channel.messages.order(:created_at).reverse.first(3)
    @documents = @channel.documents
  end

  def edit

  end

  def update
    if @channel.update(channel_params)
      redirect_to @channel
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def find_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:name)
  end
end

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
    @study = @channel.study
    @subject = @channel.subject.name
    @message = @channel.messages.new(notify: "#all")
    @messages = @channel.messages.order(:created_at).reverse.first(3)
    @message.documents.build
    @documents = @channel.documents
    @document = @channel.documents.build
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

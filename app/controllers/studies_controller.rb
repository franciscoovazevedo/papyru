class StudiesController < ApplicationController
  before_action :find_study, only: [:show, :edit, :update, :destroy]

  def index
   @studies = Study.all
  end

  def show
    @subject = @study.subject.name
    @messages = @study.last_messages.reverse
    @channels = @study.all_channels
    @documents = @study.last_documents.flatten
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def study_params
    params.require(:study).permit(:student_id, :teacher_id, :subject_id)
  end

  def find_study
    @study = Study.find(params[:id])
  end
end

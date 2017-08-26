  class StudiesController < ApplicationController
  before_action :find_study, only: [:show, :edit, :update, :destroy]
  # before_action :find_subject, only: [:new, :create]
  def index
   @studies = Study.all
  end

  def show
    @subject = @study.subject.name
    @messages = @study.last_messages.reverse
    @channels = @study.all_channels
    @documents = @study.last_documents
    @fix_navbar = true
  end

  def new
    @study = current_user.studies.new
  end

  def create
    @study = Study.new(study_params)
    @study.subject = Subject.find(params[:study].first.second) #don't know why I was not being able do reach the subject_id....
    current_user.teacher? ? @study.teacher = current_user : @study.student = current_user
    if current_user.studies.where(subject_id: params[:study].first.second).empty?
      if @study.save
        redirect_to @study
      else
        render :new
      end
    end
    redirect_to studies_path
  end

  # def add_students_to_study

  # end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def study_params
    params.require(:study).permit(:subject_id)
  end

  def find_study
    @study = Study.find(params[:id])
  end
end

  class StudiesController < ApplicationController
  before_action :find_study, only: [:show, :edit, :update, :destroy]
  before_action :find_subject, only: [:add_students_to_study]
  def index
   @studies = Study.all
  end

  def show
    @subject = @study.subject.name
    @messages = @study.last_messages.reverse
    @channels = @study.all_channels
    @documents = @study.documents
    @fix_navbar = true
  end

  def new
    @study = Study.new
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
    else
       redirect_to studies_path
    end
  end

  # def add_students_to_study

  # end

  def add_students_to_study
    file = params[:file]
    workbook = RubyXL::Parser.parse(file.path)
    worksheet = workbook[0]
    first_row = worksheet[0]

    # iterate over each row
    worksheet.each_with_index do |row, row_index|

      # iterate over each cell
      row && row.cells.each_with_index do |cell, cell_index|

          # save cell value to variable
        val = cell && cell.value
        byebug
        student = Student.where(email: val)
        unless student.empty?
          Study.create(subject: @subject, student: student.first)
        end
      end
    end

      redirect_to studies_path, notice: 'Students successful uploaded'
  end

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
    params.require(:study).permit(:subject_id, :csv_file, :csv_file_path)
  end

  def find_study
    @study = Study.find(params[:id])
  end
end

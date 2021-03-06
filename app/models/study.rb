class Study < ApplicationRecord
  mount_uploader :Csv_File, CsvFileUploader
  belongs_to :subject
  belongs_to :teacher, optional: true
  belongs_to :student, optional: true
  has_many :channels
  has_many :messages, through: :channels
  has_many :documents, through: :messages

  validate :checkTeacherStudent

  def last_messages
    Message.where(channel_id: all_channels.collect(&:id)).order(:created_at).limit(10)
  end

  def last_documents
    last_messages.map(&:documents)
  end

  def all_channels
    subject.channels
  end

  private

  def checkTeacherStudent
    errors.add(:teacher_id, "is mandatory") if student.nil? && teacher.nil?
  end
end

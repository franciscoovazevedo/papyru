class Study < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher, optional: true
  belongs_to :student, optional: true
  validate :checkTeacherStudent

  private

  def checkTeacherStudent
    errors.add(:teacher_id, "is mandatory") if student.nil? && teacher.nil?
  end
end

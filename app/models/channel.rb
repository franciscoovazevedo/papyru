class Channel < ApplicationRecord
  has_many :messages
  belongs_to :study
  has_many :teachers, through: :study
  has_many :documents, through: :messages
  validates :name, presence: true, length: { maximum: 30}
  before_save :default_values
  delegate :subject, to: :study

  def documents
    Document.where(message_id: messages.collect(&:id)).order(:created_at)
  end

  def students
    Student.joins(:studies).where("studies.subject_id = ?", self.study.subject_id)
  end

  def teachers
    Teacher.joins(:studies).where("studies.subject_id = ?", self.study.subject_id)
  end

  private

  def default_values
    self.status ||= true # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end
end

class Channel < ApplicationRecord
  has_many :messages
  belongs_to :study
  has_many :teachers, through: :study
  validates :name, presence: true, length: { maximum: 30}
  before_save :default_values

  def students
    Student.joins(:studies).where("studies.subject_id = ?", self.study.subject_id)
  end

  private

  def default_values
    self.status ||= true # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end
end

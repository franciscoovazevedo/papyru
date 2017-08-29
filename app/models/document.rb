class Document < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :message
  validates :name, presence: true
  validates_inclusion_of :filetype, :in => %w( exercise former-exam exam slide notification )
  before_validation :default_values
  validates :file, presence: true
  scope :exercise, -> { where(filetype: 'exercise') }
  scope :notification, -> { where(filetype: 'notification') }
  scope :former_exam, -> { where(filetype: 'former-exam') }
  scope :exam, -> { where(filetype: 'exam') }
  scope :slide, -> { where(filetype: 'slide') }

  private

  def default_values
    self.filetype ||= "notification" # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end

end

class Document < ApplicationRecord
  belongs_to :message
  validates_inclusion_of :filetype, :in => %w( exercise former-exam exam slide notification )
  before_validation :default_values

  private

  def default_values
    self.filetype ||= "notification" # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end

end

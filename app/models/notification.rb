class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :message
  # validates_inclusion_of :addressee, :in => %w( all group one )
  before_validation :default_values


  private

  def default_values
    self.status = false
    # self.addressee ||= "all"
  end
end

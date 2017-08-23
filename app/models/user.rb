

class User < ApplicationRecord
  # mount_uploader :photo, PhotoUploader
  has_many :notifications
  has_many :messages
  # self.abstract_class = true
  # validates :name, presence: true, format: { with: /\A[A-Za-zçÇ ]+\z/,
  #   message: "only allows letters" }
  # validates :address, presence: true
  # validates :phone_number, presence: true, uniqueness: true, format:
  #   { with: /\A(\+351)?(9|2)\d{8}\z/i }
  # validates :school_number, presence: true, uniqueness: true, length: { maximum: 10 }
  # validates_presence_of :mayor_id, :on => :update, :message => "you need a mayor to register", unless: :teacher?
  # # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  before_save :default_school_number

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def teacher?
    self.type == "Teacher"
  end

  def default_school_number
    self.school_number = self.type.first.downcase + self.school_number
  end

  def default_school_number
    self.school_number = self.type.first.downcase + self.school_number
  end


end

class User < ApplicationRecord
  has_many :notifications
  has_many :messages

  validates :name, presence: true, format: { with: /\A[A-Za-zçÇ ]+\z/,
    message: "only allows letters" }
  validates :address, presence: true
  validates :phone_number, presence: true, uniqueness: true, format:
    { with: /\A(\+351)?(9|2)\d{8}\z/i }
  validates :school_number, presence: true, uniqueness: true, length: { maximum: 10 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

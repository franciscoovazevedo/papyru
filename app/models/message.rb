class Message < ApplicationRecord
  attr_accessor :notify
  belongs_to :channel
  belongs_to :user

  has_many :notifications
  has_many :documents, inverse_of: :message

  validates :content, presence: true
  validates :identity, presence: true

  after_save :send_notifications, :if => :notification?

  #
  accepts_nested_attributes_for :documents, reject_if: proc { |doc| doc["name"].blank? }

  def has_document?
    Document.where(message: self).empty? ? false : true
  end

  private

  def notification?
    @notify.present?
    # self.documents.last.filetype == "notification" if self.has_document?
  end

  def send_notifications
    byebug
    regex = /#[^ ]*/
    students = self.channel.students
    recipients = if @notify.include?('#all')
      channel.students
    else
      notify.scan(regex).map do |email|
        email[0] = ''
        students.where(email: email).first
      end
    end

    recipients.each { |student| notifications.create(user: student) }
  end

  # def email_dont_exist(student)
  #   # flash.now[:alert] = "#{student.email} not found!"

  # end

  def send_notification_preparation(students, email)
    byebug
    email[0] = ''
    emailsStudents = students.map { |student| student.email }
    emailsStudents.include? email ? true : false
  end

  def send_noti_to_user(student)
    Notification.create(user: student, message: self)
  end
end

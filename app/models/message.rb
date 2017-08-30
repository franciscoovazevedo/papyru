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

  def show?
    self.show
  end





  def notify_all?
    @notify.include?("#all")

  end

  def change_show!
    self.show = true
  end

  private

  def notification?
    @notify.present?
  end

  def send_notifications
    regex = /#[^ ]*/
    students = self.channel.students
    recipients = []
    if @notify.include?('#all')
      recipients = channel.students
    else
      recipients = @notify.scan(regex).map do |email|
        email[0] = ''
        students.find_by_email(email)
      end
    end

    recipients.each { |student| notifications.create(user: student) }
  end

  def send_notification_preparation(students, email)
    email[0] = ''
    emailsStudents = students.map { |student| student.email }
    emailsStudents.include? email ? true : false
  end

  def send_noti_to_user(student)
    Notification.create(user: student, message: self)
  end
end

class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  has_many :notifications
  has_many :documents, inverse_of: :message

  validates :content, presence: true
  validates :identity, presence: true

  after_save :send_notifications, :if => :notification?
  #
  accepts_nested_attributes_for :documents

  def has_document?
    Document.where(message: self).empty? ? false : true
  end

  private

  def notification?
    self.documents.last.filetype == "notification" if self.has_document?
  end

  def send_notifications
    regex = /#[^ ]*/
    students = self.channel.students
    emails = self.content.scan(regex)
    if emails.first == "#all"
      students.each do |student|
        Notification.create(message: self, user: student)
      end
    else
      emails.each do |email|
        email[0] = ''
        student = students.where(email: email)
        if student.any?
          Notification.create(message: self, user: student.first)
        end
      # byebug
      # students.each do |student|

      #   emails.each do |email|
      #     send_notification_preparation(students, email) ? send_noti_to_user(student) : email_dont_exist(student)
      #   end
      end
    end
  end

  def email_dont_exist(student)
    # flash.now[:alert] = "#{student.email} not found!"

  end

  def send_notification_preparation(students, email)
    byebug
    email[0] = ''
    emailsStudents = students.map { |student| student.email }
    emailsStudents.include? email ? true : false
  end

  # def check_email_students(students, email)
  #   email = email[0] = ''
  #   students.each do |student|
  #     student.email == email
  #     send_noti_to_user(student)
  #   end


  def send_noti_to_user(student)
    Notification.create(user: student, message: self)
  end
end

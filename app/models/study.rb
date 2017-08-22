class Study < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  belongs_to :student
end

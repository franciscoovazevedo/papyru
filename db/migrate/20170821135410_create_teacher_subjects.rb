class CreateTeacherSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_subjects do |t|
      t.references :teacher, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end

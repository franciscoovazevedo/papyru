class AddStiToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key "teacher_subjects", "teachers"
    remove_foreign_key "student_subjects", "students"
    add_column :users, :mayor_id, :integer
    add_column :users, :type, :string
    drop_table :teachers
    drop_table :students
  end
end

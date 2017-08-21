class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.references :mayor, foreign_key: true

      t.timestamps
    end
  end
end

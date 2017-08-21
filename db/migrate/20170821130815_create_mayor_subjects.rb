class CreateMayorSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :mayor_subjects do |t|
      t.references :mayor, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end

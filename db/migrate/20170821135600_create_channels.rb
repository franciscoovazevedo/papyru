class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.boolean :status
      t.references :teacher_subject, foreign_key: true

      t.timestamps
    end
  end
end

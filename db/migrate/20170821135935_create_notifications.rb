class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :message, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end

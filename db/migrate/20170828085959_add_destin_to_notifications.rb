class AddDestinToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :addressee, :string
  end
end

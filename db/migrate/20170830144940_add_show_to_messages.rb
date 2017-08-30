class AddShowToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :show, :boolean
  end
end

class AddNameToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :name, :string
  end
end

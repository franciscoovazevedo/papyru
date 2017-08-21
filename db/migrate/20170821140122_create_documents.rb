class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :type
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end

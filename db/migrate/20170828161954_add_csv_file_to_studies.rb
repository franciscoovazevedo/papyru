class AddCsvFileToStudies < ActiveRecord::Migration[5.0]
  def change
    add_column :studies, :CSV_File, :string
  end
end

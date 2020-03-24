class AddAirtableKeyToSourceContents < ActiveRecord::Migration[6.0]
  def change
    add_column :source_contents, :airtable_key, :string
  end
end

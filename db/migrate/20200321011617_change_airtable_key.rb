class ChangeAirtableKey < ActiveRecord::Migration[6.0]
  def change
    change_column :authors, :airtable_key, :string
  end
end

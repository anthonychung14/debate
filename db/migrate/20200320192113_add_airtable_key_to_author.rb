class AddAirtableKeyToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :airtable_key, :bigint
    add_column :authors, :notes, :string
    add_column :authors, :gif_url, :string
    add_column :authors, :giphy_id, :string

    add_column :source_contents, :gif_url, :string
    add_column :source_contents, :giphy_id, :string
    add_column :source_contents, :synopsis, :string
  end
end

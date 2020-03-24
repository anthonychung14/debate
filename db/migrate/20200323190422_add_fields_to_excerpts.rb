class AddFieldsToExcerpts < ActiveRecord::Migration[6.0]
  def change
    add_column :excerpts, :gif_url, :string
    add_column :excerpts, :giphy_url, :string
    add_column :excerpts, :airtable_key, :string
  end
end

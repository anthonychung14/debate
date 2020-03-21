class AddColumnsToContentMaker < ActiveRecord::Migration[6.0]
  def change
    add_column :content_makers, :airtable_key, :string
    add_column :content_makers, :notes, :string
    add_column :content_makers, :address, :string
    add_column :content_makers, :city, :string
    add_column :content_makers, :zipcode, :int
  end
end

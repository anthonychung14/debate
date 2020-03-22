class AddLinksToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :excerpts, :link, :string
    add_column :excerpts, :image_link, :string
    add_column :source_contents, :md5hash, :string
    add_column :source_contents, :image_link, :string
  end
end

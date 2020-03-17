class SourceContentRename < ActiveRecord::Migration[6.0]
  def change
    add_column :source_contents, :content_category, :string
  end
end

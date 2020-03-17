class AddSourceContentRefToExcerpts < ActiveRecord::Migration[6.0]
  def change
    remove_column :excerpts, :source_content_id
    add_reference :excerpts, :source_content, null: false, foreign_key: true
  end
end

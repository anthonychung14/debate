class AddContentMediumToExcerpts < ActiveRecord::Migration[6.0]
  def change
    add_column :excerpts, :content_medium, :string
  end
end

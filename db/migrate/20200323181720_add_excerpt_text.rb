class AddExcerptText < ActiveRecord::Migration[6.0]
  def change
    add_column :excerpts, :text_content, :string
  end
end

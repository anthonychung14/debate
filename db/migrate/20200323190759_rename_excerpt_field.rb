class RenameExcerptField < ActiveRecord::Migration[6.0]
  def change
    rename_column :excerpts, :giphy_url, :giphy_id
  end
end

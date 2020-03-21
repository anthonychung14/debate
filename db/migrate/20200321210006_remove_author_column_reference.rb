class RemoveAuthorColumnReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :source_contents, :author_id
  end
end

class RenameJoinTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :authors_source_content_works, :authors_source_contents
  end
end

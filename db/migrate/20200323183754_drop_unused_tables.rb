class DropUnusedTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :authors, force: :cascade
    drop_table :authors_source_contents, force: :cascade
  end
end

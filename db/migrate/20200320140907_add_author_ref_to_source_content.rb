class AddAuthorRefToSourceContent < ActiveRecord::Migration[6.0]
  def change
    add_reference :source_contents, :author, null: false, foreign_key: true, default: 1
  end
end

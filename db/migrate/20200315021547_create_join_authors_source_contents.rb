class CreateJoinAuthorsSourceContents < ActiveRecord::Migration[6.0]
  def change
    create_table :authors_source_content_works do |t|
      t.references :authors, foreign_key: true
      t.references :source_contents, foreign_key: true
    end
  end
end

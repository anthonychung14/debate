class CreateJoinAuthorsSourceContents < ActiveRecord::Migration[6.0]
  def change
    create_table :authors_source_content_works do |t|
      t.references :authors, foreign_key: true
      t.references :source_contents, foreign_key: true

      # TODO: some source content will connect to a publisher's id instead of an author
      # assumes either an original work or a publisher
    end
  end
end

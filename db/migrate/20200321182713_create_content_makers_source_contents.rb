class CreateContentMakersSourceContents < ActiveRecord::Migration[6.0]
  def change
    create_table :content_makers_source_contents do |t|
      t.references :content_maker, null: false, foreign_key: true
      t.references :source_content, null: false, foreign_key: true
    end
  end
end

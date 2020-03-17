class CreateSourceContents < ActiveRecord::Migration[6.0]
  def change
    create_table :source_contents do |t|
      t.string :link
      t.string :title
      t.string :subtitle
      t.string :publisher
      t.bigint :publish_date
      t.string :content_category
      t.timestamps
    end
  end
end

class CreateExcerpts < ActiveRecord::Migration[6.0]
  def change
    create_table :excerpts do |t|
      t.integer :start_position
      t.integer :end_position
      t.integer :source_content_id

      t.timestamps
    end
  end
end

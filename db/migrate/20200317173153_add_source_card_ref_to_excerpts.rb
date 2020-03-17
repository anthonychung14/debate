class AddSourceCardRefToExcerpts < ActiveRecord::Migration[6.0]
  def change
    add_reference :excerpts, :source_card, null: false, foreign_key: true
  end
end

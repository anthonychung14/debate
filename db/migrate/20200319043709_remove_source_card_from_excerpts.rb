class RemoveSourceCardFromExcerpts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :excerpts, :source_cards, null: false, foreign_key: true
  end
end

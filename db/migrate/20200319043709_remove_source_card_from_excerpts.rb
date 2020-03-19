class RemoveSourceCardFromExcerpts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :excerpts, :source_card, null: false, foreign_key: true
  end
end

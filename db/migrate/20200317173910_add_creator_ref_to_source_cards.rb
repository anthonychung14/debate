class AddCreatorRefToSourceCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :source_cards, :creator, null: false, foreign_key: true
  end
end

class AddGifUrlToSourceCards < ActiveRecord::Migration[6.0]
  def change
    add_column :source_cards, :gif_url, :string
  end
end

class SourceContent < ApplicationRecord
  # has_many :excerpts
  # has_many :source_card
  has_many :authors_source_content_works
  has_many :authors, through: :source_content_works
  has_many :excerpts
  has_many :source_cards
end

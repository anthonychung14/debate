class SourceContent < ApplicationRecord
  has_and_belongs_to_many :authors
  has_many :excerpts
  has_many :source_cards
end

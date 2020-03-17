class Excerpt < ApplicationRecord
  has_many :source_cards
  belongs_to :source_content
end

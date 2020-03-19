class Excerpt < ApplicationRecord
  has_many :source_cards, optional: true
  belongs_to :source_content
end

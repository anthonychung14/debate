class Excerpt < ApplicationRecord
  belongs_to :source_card
  has_one :source_content
end

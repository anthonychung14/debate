class SourceCard < ApplicationRecord
  has_one :card_creator
  has_one :source_content
  has_one :excerpt
end

class SourceCard < ApplicationRecord
  belongs_to :card_creator
  belongs_to :source_content
  belongs_to :excerpt
end

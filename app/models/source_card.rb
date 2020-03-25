class SourceCard < ApplicationRecord
  # belongs_to :source_content
  belongs_to :excerpt, optional: true
  belongs_to :creator
end

class ContentMaker < ApplicationRecord
  has_and_belongs_to_many :source_contents
end

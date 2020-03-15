class Author < ApplicationRecord
  has_many :authors_source_content_works
  has_many :source_contents, through: :source_content_works
end

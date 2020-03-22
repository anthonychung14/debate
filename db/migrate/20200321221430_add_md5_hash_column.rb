class AddMd5HashColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :source_contents, :md5hash, :string
  end
end

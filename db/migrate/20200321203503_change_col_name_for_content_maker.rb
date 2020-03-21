class ChangeColNameForContentMaker < ActiveRecord::Migration[6.0]
  def change
    rename_column :content_makers, :fullName, :full_name
  end
end

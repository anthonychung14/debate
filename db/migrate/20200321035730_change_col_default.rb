class ChangeColDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :source_contents, :content_category, "OTHER"
  end
end

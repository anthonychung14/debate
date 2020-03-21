class AddSeriesNameToSourceContent < ActiveRecord::Migration[6.0]
  def change
    add_column :source_contents, :series_name, :string
  end
end

class AddLastField < ActiveRecord::Migration[6.0]
  def change
    add_column :excerpts, :title, :string
  end
end

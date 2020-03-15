class ChangePublishDateType < ActiveRecord::Migration[6.0]
  def change
    change_column :source_contents, :publish_date, :bigint
  end
end

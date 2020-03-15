class CreateSourceCards < ActiveRecord::Migration[6.0]
  def change
    create_table :source_cards do |t|
      t.string :header
      t.string :warrant
      t.string :subheader

      t.timestamps
    end
  end
end

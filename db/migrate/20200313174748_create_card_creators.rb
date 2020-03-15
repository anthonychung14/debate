class CreateCardCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :card_creators do |t|
      t.string :email
      t.string :name
      t.string :string

      t.timestamps
    end
  end
end

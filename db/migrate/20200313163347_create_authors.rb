class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :full_name
      t.string :education
      t.text :description
      t.string :occupation

      t.timestamps
    end
  end
end

class AddAddressFieldsToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :address, :string
    add_column :authors, :city, :string
    add_column :authors, :zipcode, :int
  end
end

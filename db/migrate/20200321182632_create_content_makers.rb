class CreateContentMakers < ActiveRecord::Migration[6.0]
  def change
    create_table :content_makers do |t|
      t.string :fullName
      t.string :instagramHandle

      t.timestamps
    end
  end
end

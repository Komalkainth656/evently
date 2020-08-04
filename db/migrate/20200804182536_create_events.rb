class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.float :price
      t.string :image_url

      t.timestamps
    end
  end
end

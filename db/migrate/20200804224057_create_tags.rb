class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
 
      t.timestamps
    end
  end
end

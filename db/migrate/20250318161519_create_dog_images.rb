class CreateDogImages < ActiveRecord::Migration[8.0]
  def change
    create_table :dog_images do |t|
      t.string :url
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end

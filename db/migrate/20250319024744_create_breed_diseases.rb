class CreateBreedDiseases < ActiveRecord::Migration[8.0]
  def change
    create_table :breed_diseases do |t|
      t.references :breed, null: false, foreign_key: true
      t.references :dog_disease, null: false, foreign_key: true

      t.timestamps
    end
  end
end

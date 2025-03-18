class CreateBreedFacts < ActiveRecord::Migration[8.0]
  def change
    create_table :breed_facts do |t|
      t.references :fact, null: false, foreign_key: true
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end

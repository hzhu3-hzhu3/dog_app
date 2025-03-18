class CreateFacts < ActiveRecord::Migration[8.0]
  def change
    create_table :facts do |t|
      t.text :fact

      t.timestamps
    end
  end
end

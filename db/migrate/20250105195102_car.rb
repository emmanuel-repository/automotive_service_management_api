class Car < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.string :plate_number, limit: 10, null: false
      t.string :model, limit: 12, null: false
      t.integer :year, null: false
      t.string :slug, limit: 100, null: false

      t.timestamps
    end

    add_index :cars, :plate_number, unique: true, name: 'cars_pk'
  end
end

class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false, default: ''
      t.string :state, null: false, default: ''
      t.float :lat
      t.float :lng
      t.string :nickname
      t.integer :population
      t.string :address

      t.timestamps
    end

    add_index :cities, [:lat, :lng]
  end
end

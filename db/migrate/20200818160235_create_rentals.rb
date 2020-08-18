class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :goat, null: false, foreign_key: true

      t.timestamps
    end
  end
end

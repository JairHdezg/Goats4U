class CreateGoats < ActiveRecord::Migration[6.0]
  def change
    create_table :goats do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.text :job
      t.string :city
      t.integer :price_par_day
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

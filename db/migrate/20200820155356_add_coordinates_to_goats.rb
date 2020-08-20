class AddCoordinatesToGoats < ActiveRecord::Migration[6.0]
  def change
    add_column :goats, :latitude, :float
    add_column :goats, :longitude, :float
  end
end

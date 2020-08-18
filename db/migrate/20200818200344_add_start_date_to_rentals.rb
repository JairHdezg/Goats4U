class AddStartDateToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :start_date, :datetime
    add_column :rentals, :end_date, :datetime
  end
end

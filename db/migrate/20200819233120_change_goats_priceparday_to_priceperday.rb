class ChangeGoatsPricepardayToPriceperday < ActiveRecord::Migration[6.0]
  def change
    rename_column :goats, :city, :address
    rename_column :goats, :price_par_day, :price_per_day
  end
end

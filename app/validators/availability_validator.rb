class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    rentals = Rental.where(["goat_id =?", record.goat_id])
    date_ranges = rentals.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end

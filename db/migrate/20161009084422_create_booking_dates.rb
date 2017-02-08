class CreateBookingDates < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_dates do |t|
      t.date :reserved_date
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end

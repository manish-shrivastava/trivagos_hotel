# == Schema Info
#
# Table name: booking_dates
#
# id                         :integer(11), not null, primary key
# reserved_date              :date
# booking_id                 :integer(11)
# created_at                 :datetime, not null
# updated_at                 :datetime, not null

class BookingDate < ApplicationRecord
  # adding belongs to relationship with booking
  belongs_to :booking
end

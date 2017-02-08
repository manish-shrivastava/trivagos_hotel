# == Schema Info
#
# Table name: users
#
# id                         :integer(11), not null, primary key
# email                      :string
# first_name                 :string
# last_name                  :string
# mobile  					 :string
# authentication_token       :string(30)
# encrypted_password         :string
# reset_password_token  	 :string
# reset_password_sent_at     :datetime
# remember_created_at        :datetime
# sign_in_count              :integer(11), not null
# current_sign_in_at         :datetime
# last_sign_in_at            :datetime
# current_sign_in_ip         :string
# last_sign_in_ip            :string
# created_at                 :datetime, not null
# updated_at                 :datetime, not null

class User < ApplicationRecord
  # For token based authentication
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many relationship with the bookings
  # fetching all the bookings of the user
  has_many :bookings

  # These attributes should always be present
  validates :first_name, :last_name, :mobile, presence: true
end

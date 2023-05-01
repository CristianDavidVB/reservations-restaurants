class Reservation < ApplicationRecord
  belongs_to :restaurant
  validates :number_tables,
            :customer_name,
            :date,
            presence: true
  validates :customer_email, presence: true, uniqueness: true
  validates_format_of :customer_email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "must be a valid email address"
end

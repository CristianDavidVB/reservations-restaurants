class Reservation < ApplicationRecord
  belongs_to :restaurant
  validates :number_tables, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :customer_name,
            :date,
            presence: true
  validates :customer_email, presence: true, uniqueness: true
  validates_format_of :customer_email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "must be a valid email address"

end
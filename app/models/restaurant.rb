class Restaurant < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, :city, :photo, presence: true
end

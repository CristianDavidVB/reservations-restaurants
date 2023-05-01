class ReservationSerializer < ActiveModel::Serializer
  attributes :id, number_tables, :customer_name, :customer_email, :date, :restaurant_id
end

module Queries
  module Reservations
    class ReservationFinder
      def call(number_tables: nil , customer_name: nil, customer_email: nil, date: nil, restaurant_id: nil)
        scope = initial_scope
        scope = scoped.where("number_tables like ?", number_tables) if number_tables.present?
        scope = scoped.where("customer_name like ?", customer_name) if customer_name.present?
        scope = scoped.where("customer_email like ?", customer_email) if customer_email.present?
        scope = scoped.where(date: date) if date.present?
        scope = scoped.where(restaurant_id: restaurant_id) if restaurant_id.present?
        scope
      end
      def initial_scope
        Reservation.all
      end
    end
  end
end
module Queries
  module Reservations
    class ReservationsQuery < GraphQL::Schema::Resolver
      description 'Get all reservations'
      type [Types::ReservationType], null: false

      argument :page, Integer, required: false
      argument :per_page, Integer, required: false
      argument :customer_name, String, required: false
      argument :customer_email, String, required: false
      argument :date, GraphQL::Types::ISO8601Date, required: false
      argument :restaurant_id, Integer, required: false

      def resolve(page: nil, per_page: nil, number_tables: nil, customer_name: nil, customer_email: nil, date: nil, restaurant_id: nil)
        reservations = ReservationFinder.new.call(
          number_tables: number_tables,
          customer_name: customer_name,
          customer_email: customer_email,
          date: date,
          restaurant_id: restaurant_id)

        reservations.paginate(page: page, per_page: per_page)
      end
    end
  end
end
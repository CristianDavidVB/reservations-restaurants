module Queries
  module Reservations
    class ReservationQuery < GraphQL::Schema::Resolver
      description "Returns a reservation by ID"

      type Types::ReservationType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        Reservation.find(id)
      end
    end
  end
end
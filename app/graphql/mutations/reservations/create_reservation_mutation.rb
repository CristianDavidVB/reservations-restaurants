module Mutations
  module Reservations
    class CreateReservationMutation < GraphQL::Schema::Mutation
      argument :number_tables, Integer, required: true
      argument :customer_name, String, required: true
      argument :customer_email, String, required: true
      argument :date, GraphQL::Types::ISO8601Date, required: true
      argument :restaurant_id, Integer, required: true

      field :reservation, Types::ReservationType
      field :errors, [String]

      def resolve(**attributes)
        reservation = Reservation.new(attributes)

        if reservation.save
          ReservationConfirmationMailer.reservation_confirmation(reservation).deliver_now
          { reservation: reservation, errors:[] }

        else
          { reservation: nil, errors: reservation.errors.full_messages }
        end
      end
    end
  end
end
module Types
  class MutationType < Types::BaseObject
    field :create_restaurant, mutation: Mutations::Restaurants::CreateRestaurantMutation
    field :update_restaurant, mutation: Mutations::Restaurants::UpdateRestaurantMutation
    field :delete_restaurant, mutation: Mutations::Restaurants::DeleteRestaurantMutation

    field :create_reservation, mutation: Mutations::Reservations::CreateReservationMutation

    field :login, mutation: Mutations::Auth::AuthenticationMutation
  end
end

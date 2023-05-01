module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :restaurants, resolver: Queries::Restaurants::RestaurantsQuery
    field :restaurant, resolver: Queries::Restaurants::RestaurantQuery

    field :reservations, resolver: Queries::Reservations::ReservationsQuery
    field :reservation, resolver: Queries::Reservations::ReservationQuery
  end
end

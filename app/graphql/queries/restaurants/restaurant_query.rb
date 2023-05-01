module Queries
  module Restaurants
    class RestaurantQuery < GraphQL::Schema::Resolver
      description "Returns a restaurant by ID"

      type Types::RestaurantType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        Restaurant.find(id)
      end
    end
  end
end
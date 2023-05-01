module Mutations
  module Restaurants
    class CreateRestaurantMutation < GraphQL::Schema::Mutation
      argument :name, String, required: true
      argument :description, String
      argument :address, String, required: true
      argument :city, String, required: true
      argument :photo, String, required: true

      field :restaurant, Types::RestaurantType
      field :errors, [String]

      def resolve(**attributes)
        restaurant = Restaurant.new(attributes)

        if restaurant.save
          { restaurant: restaurant, errors:[] }
        else
          { restaurant: nil, errors: restaurant.errors.full_messages }
        end
      end
    end
  end
end
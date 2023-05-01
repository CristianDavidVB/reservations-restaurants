module Mutations
  module Restaurants
    class UpdateRestaurantMutation < GraphQL::Schema::Mutation
      argument :id, ID, required: true
      argument :name, String
      argument :description, String
      argument :address, String
      argument :city, String
      argument :photo, String

      field :restaurant, Types::RestaurantType
      field :errors, [String]

      def resolve(id:, **attributes)
        restaurant = Restaurant.find(id)

        if restaurant.update(attributes)
          { restaurant: restaurant, errors: []}
        else
          { restaurant: nil, errors:country.errors.full_messages }
        end
      end
    end
  end
end
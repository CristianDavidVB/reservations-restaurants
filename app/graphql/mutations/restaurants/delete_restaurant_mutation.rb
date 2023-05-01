module Mutations
  module Restaurants
    class DeleteRestaurantMutation < GraphQL::Schema::Mutation
      argument :id, ID, required: true

      field :id, ID
      field :errors, [String]

      def resolve(id:)
        restaurant = Restaurant.find(id)

        if restaurant.destroy
          {id: id, errors: [] }
        else
          {id: nil, errors: restaurant.errors.full_messages}
        end
      end
    end
  end
end
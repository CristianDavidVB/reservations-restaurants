module Queries
  module Restaurants
    class RestaurantsQuery < GraphQL::Schema::Resolver
      description 'Get all restaurants'
      type [Types::RestaurantType], null: false

      argument :page, Integer, required: false
      argument :per_page, Integer, required: false
      argument :name, String, required: false
      argument :city, String, required: false
      def resolve(page: nil, per_page: nil, name: nil, city: nil)
        restaurants = RestaurantFinder.new.call(
          name: name,
          city: city)

        restaurants.paginate(page: page, per_page: per_page)
      end
    end
  end
end
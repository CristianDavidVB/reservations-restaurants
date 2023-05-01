module Queries
  module Restaurants
    class RestaurantFinder
      def call(name: nil, city: nil)
        scoped = initial_scope
        scoped = scoped.where("name like ?", "#{name}%") if name.present?
        scoped = scoped.where(city: city) if city.present?
        scoped
      end
      def initial_scope
        Restaurant.all
      end
    end
  end
end
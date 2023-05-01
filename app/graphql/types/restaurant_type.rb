module Types
    class RestaurantType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: false
      field :address, String, null: false
      field :city, String, null: false
      field :photo, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
end
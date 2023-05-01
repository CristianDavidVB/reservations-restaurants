module Types
  class ReservationType < Types::BaseObject
    field :id, ID, null: false
    field :number_tables, Integer, null: false
    field :customer_name, String, null: false
    field :customer_email, String, null: false
    field :date, GraphQL::Types::ISO8601Date, null: false
    field :restaurant, Types::RestaurantType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
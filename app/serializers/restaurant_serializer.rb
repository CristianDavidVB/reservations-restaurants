class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address, :city, :photo
end

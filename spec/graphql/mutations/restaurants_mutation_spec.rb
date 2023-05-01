require 'rails_helper'

RSpec.describe "Restaurants Mutations", type: :request do
  describe "create_restaurant" do
    it "creates a new restaurant" do
      post "/graphql",
           params: {
             query:
               "mutation {
                createRestaurant( name: \"Palenque\", description: \"lorem\", address: \"calle 14\", city: \"Barranquilla\", photo: \"photo.jpg\" ){
                  restaurant {
                  name
                  description
                  address
                  city
                  photo
                }
                errors
              }
            }"
           }
      expect(response).to have_http_status(200)
      data = response_data["createRestaurant"]["restaurant"]
      expect(data["name"]).to eq("Palenque")
    end
  end

  describe "update_restaurant" do
    it "update an existing restaurant" do
      restaurant = create(:restaurant)

      post "/graphql",
           params: {
             query:
               "mutation {
                  updateRestaurant(id: #{restaurant.id}, name: \"Palenque\", description: \"Expertos en mariscos\"{
                    restaurant {
                    name
                    description
                  }
                }
              }"
           }
    end
  end

  describe "delete_restaurant" do
    it "delete an existing restaurant" do
      restaurant = create(:restaurant)

      post "/graphql",
           params: {
             query:
               "mutation {
                  deleteRestaurant(id: #{restaurant.id}) {id}
                }"
           }
      expect(response).to have_http_status(200)
      data = response_data["deleteRestaurant"]

      expect(data["id"]).to eq(restaurant.id.to_s)
    end
  end
end
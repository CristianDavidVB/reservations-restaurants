require 'rails_helper'

RSpec.describe "RestaurantsQuery", type: :request do
  describe "restaurants" do
    let!(:restaurants) {create_list(:restaurant, 2)}
    context "when params are not present" do
      before do
        post "/graphql",
             params: {
               query: "{ restaurants {id name description address city photo} }"
             }
      end

      it "returns a successful response" do
        expect(response).to have_http_status(200)
      end

      it "returns all restaurants" do
        expect(response_data["restaurants"].size).to eq(2)
      end
    end

    context "when params are present" do
      let(:name) { restaurants.first.name }
      before do
        post "/graphql",
             params: {
               query:
                 "{
                    restaurants(name: \"#{name}\") {
                      name
             }
            }"
             }
      end

      it "returns a successful response" do
        expect(response).to have_http_status(200)
      end

      it "returns name restaurant" do
        expect(response_data["restaurants"][0]["name"]).to eq(name)
      end
    end
  end

  describe "restaurant" do
    it "returns a single restaurant" do
      restaurant = create(:restaurant)
      binding.break
      post "/graphql",
           params: {
             query: "{ restaurant(id: #{restaurant.id}) {id name description} }"
           }
      expect(response).to have_http_status(200)

      expect(response_data["restaurant"]["id"].to_i).to eq(restaurant.id)
      expect(response_data["restaurant"]["name"]).to eq(restaurant.name)
      expect(response_data["restaurant"]["description"]).to eq(restaurant.description)
    end
  end
end
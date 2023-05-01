require 'rails_helper'

RSpec.describe "Reservations Mutations", type: :request do
  describe "create_reservation" do
    it "creates a new reservation" do
      restaurant = create(:restaurant)
      post "/graphql",
           params: {
             query:
               "mutation {
  createReservation(
    numberTables: 5,
    customerName: \"Pedro\",
  	customerEmail: \"pedro@prueba.com\",
 	 	date: \"2023-05-21\" , restaurantId: #{restaurant.id}) {
    reservation {
      numberTables,
      customerName,
      customerEmail,
      date,
      restaurant {
        name
      }
    }
    errors
  }
}"
                }
      expect(response).to have_http_status(200)
      data = response_data["createReservation"]["reservation"]
      expect(data["numberTables"]).to eq(5)
      expect(data["customerName"]).to eq("Pedro")
      expect(data["restaurant"]["name"]).to eq(restaurant.name)
    end
  end
end
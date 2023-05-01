require 'rails_helper'

RSpec.describe "ReservationsQuery", type: :request do

  describe "reservations" do
    let!(:reservations) {create_list(:reservation, 2)}
    context "when params are not present" do
      before do
        post "/graphql",
             params: {
               query: "{
                        reservations {
                        id,
                        customerName,
                        customerEmail,
                        numberTables,
                        date,
                        restaurant{
                            id
                            name }
                        }
                       }"
                      }
      end

      it "returns a successful response" do
        expect(response).to have_http_status(200)
      end

      it "returns all reservations" do
        expect(response_data["reservations"].size).to eq(2)
      end
    end

  end

  describe "reservation" do
    it 'returns a single reservation' do
      reservation = create(:reservation)
      post "/graphql",
            params: {
              query: "{ reservation(id: #{reservation.id}) {id customerName customerEmail} }"
            }
      expect(response).to have_http_status(200)

      expect(response_data["reservation"]["id"].to_i).to eq(reservation.id)
      expect(response_data["reservation"]["customerName"]).to eq(reservation.customer_name)
      expect(response_data["reservation"]["customerEmail"]).to eq(reservation.customer_email)
    end
  end
end
require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe "validations" do
    subject { build(:reservation) }

    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:customer_name) }
    it { should validate_presence_of(:customer_email) }
    it { should validate_presence_of(:number_tables) }
    it { should belong_to(:restaurant) }
  end
end
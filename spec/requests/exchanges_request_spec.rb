require 'rails_helper'

RSpec.describe "Exchanges", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /convert" do
    it "returns correct converted value" do
      amount = rand(1..9999)
      source_currency = "USD"
      target_currency = "BRL"
      value = ExchangeService.new(source_currency, target_currency, amount).call

      get "/convert", params: {
        source_currency: "USD",
        target_currency: "BRL",
        amount: amount
      }
      expect(response).to have_http_status(:success)
      expect(response.content_type).to include('application/json')
      expect(JSON.parse(response.body)['value']).to eq(value)
    end
  end

end

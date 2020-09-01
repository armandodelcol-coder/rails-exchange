require 'rails_helper'
require './app/services/exchange_service'

describe ExchangeService do
  let(:source_currency) { "USD" }
  let(:target_currency) { "BRL" }
  let(:exchange_value) { 3.4546 }
  let(:api_response) do
    {
      currency: [
        currency: "#{source_currency}/#{target_currency}",
        value: exchange_value,
        date: Time.current,
        type: "original",
      ]
    }
  end

  before do
    allow(RestClient).to receive(:get) { OpenStruct.new(body: api_response.to_json) }
  end

  it "#call" do
    amount = rand(0..9999)
    service_exchange = ExchangeService.new(source_currency, target_currency, amount).call
    expected_exchange = amount * exchange_value
    expect(service_exchange).to eq expected_exchange
  end
end

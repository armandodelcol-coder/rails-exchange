class ExchangeService
  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount.to_f
  end

  def call
    begin
      value = get_exchange
      value * @amount
    rescue RestClient::ExceptionWithResponse => exception
      exception.response
    end
  end

  private

  def get_exchange
    exchange_api_url = Rails.application.credentials[:currency_api_url]
    exchange_api_key = Rails.application.credentials[:currency_api_key]
    url = "#{exchange_api_url}?token=#{exchange_api_key}&currency=#{@source_currency}/#{@target_currency}"
    response = RestClient.get(url)
    JSON.parse(response.body)['currency'][0]['value'].to_f
  end
end

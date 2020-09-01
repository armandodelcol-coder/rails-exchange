class ExchangesController < ApplicationController
  before_action :set_params, only: [:convert]

  def index
  end

  def convert
    value = ExchangeService.new(@source_currency, @target_currency, @amount).call
    render json: {value: value}
  end

  private

    def set_params
      @source_currency = params[:source_currency]
      @target_currency = params[:target_currency]
      @amount = params[:amount]
    end
end

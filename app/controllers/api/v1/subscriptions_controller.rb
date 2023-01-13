class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionsSerializer.index(customer), status: 200
  end

  def create
    subscription = Subscription.new(customer_id: params[:customer_id], tea_id: params[:tea_id], title: params[:title], price: params[:price], status: params[:status], frequency: params[:frequency])

    if subscription.save
      render json: SubscriptionsSerializer.create(subscription), status: 201
    else
      render json: ErrorsSerializer.parse_errors(subscription.errors), status: 400
    end
  end

  def update
    require 'pry'; binding.pry
  end
end
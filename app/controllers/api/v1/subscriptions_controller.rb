class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionsSerializer.index(customer), status: 200
  end

  def create
    subscription = Subscription.new(subscription_params)

    if subscription.save
      render json: SubscriptionsSerializer.create(subscription), status: 201
    else
      render json: ErrorsSerializer.parse_errors(subscription.errors), status: 400
    end
  end

  def update
    subscription = Subscription.find(params[:subscription_id])
    if subscription.update(subscription_params)
      render json: SubscriptionsSerializer.update(subscription), status: 204
    else
      render json: ErrorsSerializer.parse_errors(subscription.errors), status: 400
    end
  end

  private 

  def subscription_params
    params.permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
  end
end
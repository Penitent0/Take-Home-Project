class Api::V1::SubscriptionsController < ApplicationController
  def index
  end

  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])

    subscription = Subscription.new(customer_id: customer.id, tea_id: tea.id, title: tea.title, price: params[:price], status: params[:status], frequency: params[:frequency])

    if subscription.save
      render json: SubscriptionsSerializer.create(subscription), status: 201
    else
      render json: ErrorsSerializer.parse_errors(subscription.erros), status: 400
    end
  end

  def update 
  end
end
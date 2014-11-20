class CustomersController < ApplicationController

  before_action :authenticate_customer!

  # GET /customers/dashboard
  def dashboard
    @purchases = current_customer.purchases.order('created_at DESC').limit(5)
  end
end

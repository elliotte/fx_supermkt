class CustomersController < ApplicationController

  before_action :authenticate_customer!

  # GET /customers/dashboard
  def dashboard
  end
end

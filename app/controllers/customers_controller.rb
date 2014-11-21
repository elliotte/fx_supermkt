class CustomersController < ApplicationController

  before_action :authenticate_customer!

  # GET /customers/dashboard
  def dashboard
    @purchases = current_customer.purchases.order('created_at DESC').limit(5)
    if params[:query].blank?
      @deals = Deal.active.order('created_at desc')
    else
      @deals = Deal.search_deals(params[:query])
    end
  end
end

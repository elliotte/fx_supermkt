class VendorsController < ApplicationController

  before_action :authenticate_vendor!

  # GET /vendors/dashboard
  def dashboard
    @deals = current_vendor.deals.order('created_at DESC').limit(5)
  end
end

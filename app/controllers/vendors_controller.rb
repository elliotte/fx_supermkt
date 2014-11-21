class VendorsController < ApplicationController

  before_action :authenticate_vendor!

  # GET /vendors/dashboard
  def dashboard
    @deals = current_vendor.deals.active.order('created_at desc')
  end
end

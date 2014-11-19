class VendorsController < ApplicationController

  before_action :authenticate_vendor!

  # GET /vendors/dashboard
  def dashboard
  end
end

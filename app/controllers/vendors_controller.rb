class VendorsController < ApplicationController

  before_action :authenticate_vendor!

  # GET /customers/dashboard
  def dashboard
  end
end

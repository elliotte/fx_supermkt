class Vendors::DealsController < VendorsController

  before_action :set_deal, only: [:show, :edit, :update, :destroy]

  def index
    @deals = current_vendor.deals
  end

  def show
  end

  def new
    @deal = Deal.new
  end

  def edit
  end

  def create
    @deal = current_vendor.deals.build(deal_params)
    @deals = current_vendor.deals.active.order('created_at desc')
    if @deal.save
      respond_to do |format|
        format.html { redirect_to [:vendors, @deal], notice: 'Deal Created Successfully.' }
        format.js
      end
    else
      render :new
    end
  end

  def update
    if @deal.update(deal_params)
      redirect_to [:vendors, @deal], notice: 'Deal updated Successfully.'
    else
      render :edit
    end
  end

  def destroy
    if @deal.destroy
      redirect_to vendors_deals_url, notice: 'Deal Deleted Successfully.'
    else
      redirect_to vendors_deals_url, alert: @deal.errors.full_messages
    end
  end

  private
    def set_deal
      @deal = Deal.where(id: params[:id]).first
      redirect_to vendors_deals_path, alert: 'Unauthorised deal.' if @deal.blank?
    end

    def deal_params
      params.require(:deal).permit(:sell_currency, :buy_currency, :rate, :expiry_date)
    end
end

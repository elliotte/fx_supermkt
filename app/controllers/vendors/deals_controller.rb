class Vendors::DealsController < VendorsController

  before_action :set_deal, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @deals = current_vendor.deals
    respond_with(@deals)
  end

  def show
    respond_with(@deal)
  end

  def new
    @deal = Deal.new
    respond_with([:vendors, @deal])
  end

  def edit
  end

  def create
    @deal = current_vendor.deals.build(deal_params)
    if @deal.save
      redirect_to [:vendors, @deal], notice: 'Deal Created Successfully.'
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
      params.require(:deal).permit(:sell_currency, :buy_currency, :rate)
    end
end

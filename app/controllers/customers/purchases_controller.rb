class Customers::PurchasesController < CustomersController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def index
    @purchases = current_customer.purchases
  end

  def show
  end

  def new
    @purchase = Purchase.new
  end

  def edit
  end

  def create
    @purchase =  current_customer.purchases.build(purchase_params)
    respond_to do |format|
      if @purchase.save
        format.html do
          redirect_to [:customers, @purchase], notice: 'Deal purchase successfully.'
        end
        format.js
      else
        render :new
      end
    end
  end

  def update
    if @purchase.update(purchase_params)
      redirect_to [:customers, @purchase], notice: 'Purchase deal updated successfully.'
    else
      render :edit
    end
  end

  def destroy
     if @purchase.destroy
      redirect_to customers_purchases_url, notice: 'Purchase deal deleted successfully.'
    else
      redirect_to customers_purchases_url, alert: 'Unable to delete.'
    end
  end

  private
    def set_purchase
      @purchase = current_customer.purchases.where(id: params[:id]).first
      redirect_to customers_purchases_path, alert: 'unauthorised purchase deal.' if @purchase.blank?
    end

    def purchase_params
      params.require(:purchase).permit(:deal_id, :amount, :customer_id)
    end
end

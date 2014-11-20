require 'rails_helper'
RSpec.describe Customers::PurchasesController, :type => :controller do

  describe "response of action's for authenticated customer" do
    before do
      @current_customer = FactoryGirl.create(:customer)
      @purchase = FactoryGirl.create(:purchase, customer: @current_customer)
      @deal = @purchase.deal
      @another_customer_purchaes = FactoryGirl.create(:purchase)
      sign_in @current_customer
    end

    describe "GET 'index'" do

      it "returns http success" do
        get :index
        expect(response).to be_success
      end

      it 'should render index page' do
        get :index
        expect(response).to render_template('index')
      end

      it "assigns all purchases as @purchases" do
        get :index
        expect(assigns(:purchases)).to match_array([@purchase])
      end

      it 'should not include the diffrent vendor purchase in the list' do
        get :index
        expect(assigns(:purchases)).not_to include(@another_vendor_purchase)
      end
    end

    describe "GET 'new'" do

      it "returns http success" do
        get :new
        expect(response).to be_success
      end

      it 'should render new page' do
        get :new
        expect(response).to render_template('new')
      end

      it "assigns a new purchase as @purchase" do
        get :new
        expect(assigns(:purchase)).to be_a_new(Purchase)
      end
    end

    describe "GET 'show' " do

      it "returns http success" do
        get :show, {id: @purchase.id}
        expect(response).to be_success
      end

      it 'should render show page' do
        get :show, {id: @purchase.id}
        expect(response).to render_template('show')
      end

      it "assigns a purchase as @purchase" do
        get :show, {id: @purchase.id}
        expect(assigns(:purchase)).to eq(@purchase)
      end
    end

    describe "GET 'edit' " do

      it "returns http success" do
        get :edit, {id: @purchase.id}
        expect(response).to be_success
      end

      it 'should render edit page' do
        get :edit, {id: @purchase.id}
        expect(response).to render_template('edit')
      end

      it "assigns a purchase as @purchase" do
        get :edit, {id: @purchase.id}
        expect(assigns(:purchase)).to eq(@purchase)
      end
    end

    describe "POST 'create'" do

      it 'should increase purchase count by 1' do
        expect{
          post :create, {purchase: FactoryGirl.attributes_for(:purchase, deal_id: @deal.id )}
        }.to change(Purchase, :count).by(1)
      end

      it "should redirect to the index page " do
        post :create, {purchase: FactoryGirl.attributes_for(:purchase, deal_id: @deal.id)}
        expect(response).to redirect_to(customers_purchase_path(Purchase.last))
        is_expected.to set_the_flash[:notice].to('Deal purchase successfully.')
      end

      it 'should render new template when purchase is invalid' do
        post :create, {purchase: FactoryGirl.attributes_for(:purchase, amount: nil)}
        expect(response).to render_template('new')
      end
    end

    describe "PUT 'update' " do

      it "returns to purchase's show page after success" do
        put :update,  {purchase:
          { amount: '100'}, id: @purchase.id
        }
        expect(response).to redirect_to(customers_purchase_path(@purchase))
        is_expected.to set_the_flash[:notice].to('Purchase deal updated successfully.')
      end
      it "returns to purchase's edit page after failuer" do
        put :update,  {purchase:
          { amount: nil}, id: @purchase.id
        }
        expect(response).to render_template(:edit)
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested purchase" do
        expect {
          delete :destroy, {:id => @purchase.id}
        }.to change(Purchase, :count).by(-1)
      end

      it "redirects to the purchases list" do
       delete :destroy, {:id => @purchase.id}
        expect(response).to redirect_to(customers_purchases_url)
      end
    end
  end

  describe "response of page's without login" do

    describe 'response of update action' do

      it 'return with status 302' do
        put :update,  {purchase:
            { amount: '123456'}, id: 1 }
        expect(response.status).to eq(302)
      end

      it "should redirect to deal's login page" do
        put :update,  {purchase:
            { rate: '123456789'}, id: 1 }
        expect(response).to redirect_to(new_customer_session_path)
      end
    end

    describe " GET 'Index'" do

      it "should redirect to customers login page" do
        get :index
        expect(response).to redirect_to(new_customer_session_path)
      end

      it 'return with status 302' do
        get :index
        expect(response.status).to eq(302)
      end
    end

    describe " GET 'new'" do

      it "should redirect to customers login page" do
        get :new
        expect(response).to redirect_to(new_customer_session_path)
      end

      it 'return with status 302' do
        get :new
        expect(response.status).to eq(302)
      end
    end

    describe "POST 'create'" do

      it "should redirect to customers login page" do
        post :create, {purchase: FactoryGirl.attributes_for(:purchase)}
        expect(response).to redirect_to(new_customer_session_path)
      end

      it 'return with status 302' do
        post :create, {purchase: FactoryGirl.attributes_for(:purchase)}
        expect(response.status).to eq(302)
      end
    end

    describe "DELETE 'destroy' " do
      it 'return with status 302' do
        delete :destroy, {id: 1}
        expect(response.status).to eq(302)
      end

      it 'renders the customers login template' do
        delete :destroy, {id: 1}
        expect(response).to redirect_to(new_customer_session_path)
      end
    end

    describe "GET 'edit'" do

      it 'return with status 302' do
        post :edit, {id: 1}
        expect(response.status).to eq(302)
      end

      it 'renders the customers login template' do
        post :edit, {id: 1}
        expect(response).to redirect_to(new_customer_session_path)
      end
    end

    describe "GET 'show'" do

      it 'return with status 302' do
        post :show, {id: 1}
        expect(response.status).to eq(302)
      end

      it 'renders the customers login template' do
        post :show, {id: 1}
        expect(response).to redirect_to(new_customer_session_path)
      end
    end
  end

end

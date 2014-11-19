require 'spec_helper'

RSpec.describe Vendors::DealsController, :type => :controller do

  describe "response of action's for authenticated vendor" do
    before do
      @current_vendor = FactoryGirl.create(:vendor)
      @deal = FactoryGirl.create(:deal, vendor: @current_vendor, buy_currency: 'NZD')
      @another_vendor_deal = FactoryGirl.create(:deal, buy_currency: 'AUD')
      sign_in @current_vendor
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

      it "assigns all deals as @deals" do
        get :index
        expect(assigns(:deals)).to match_array([@deal])
      end

      it 'should not include the diffrent vendor deal in the list' do
        get :index
        expect(assigns(:deals)).not_to include(@another_vendor_deal)
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

      it "assigns a new deal as @deal" do
        get :new
        expect(assigns(:deal)).to be_a_new(Deal)
      end
    end

    describe "GET 'show' " do

      it "returns http success" do
        get :show, {id: @deal.id}
        expect(response).to be_success
      end

      it 'should render show page' do
        get :show, {id: @deal.id}
        expect(response).to render_template('show')
      end

      it "assigns a deal as @deal" do
        get :show, {id: @deal.id}
        expect(assigns(:deal)).to eq(@deal)
      end
    end

    describe "GET 'edit' " do

      it "returns http success" do
        get :edit, {id: @deal.id}
        expect(response).to be_success
      end

      it 'should render edit page' do
        get :edit, {id: @deal.id}
        expect(response).to render_template('edit')
      end

      it "assigns a deal as @deal" do
        get :edit, {id: @deal.id}
        expect(assigns(:deal)).to eq(@deal)
      end
    end

    describe "POST 'create'" do

      it 'should increase deal count by 1' do
        expect{
          post :create, {deal: FactoryGirl.attributes_for(:deal)}
        }.to change(Deal, :count).by(1)
      end

      it "should redirect to the index page " do
        post :create, {deal: FactoryGirl.attributes_for(:deal)}
        expect(response).to redirect_to(vendors_deal_path(Deal.last))
      end

      it 'should render new template when deal is invalid' do
        post :create, {deal: FactoryGirl.attributes_for(:deal, :rate => nil )}
        expect(response).to render_template('new')
      end
    end

    describe "PUT 'update' " do

      it "returns to deal's show page after success" do
        put :update,  {deal:
          { rate: '100'}, id: @deal.id
        }
        expect(response).to redirect_to(vendors_deal_path(@deal))
        is_expected.to set_the_flash[:notice].to('Deal updated Successfully.')
      end
      it "returns to deal's edit page after failuer" do
        put :update,  {deal:
          { rate: nil}, id: @deal.id
        }
        expect(response).to render_template(:edit)
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested deal" do
        expect {
          delete :destroy, {:id => @deal.id}
        }.to change(Deal, :count).by(-1)
      end

      it "redirects to the deals list" do
       delete :destroy, {:id => @deal.id}
        expect(response).to redirect_to(vendors_deals_url)
      end
    end
  end

  describe "response of page's without login" do

    describe 'response of update action' do

      it 'return with status 302' do
        put :update,  {deal:
            { rate: '123456789'}, id: 1 }
        expect(response.status).to eq(302)
      end

      it "should redirect to deal's login page" do
        put :update,  {deal:
            { rate: '123456789'}, id: 1 }
        expect(response).to redirect_to(new_vendor_session_path)
      end
    end

    describe " GET 'Index'" do

      it "should redirect to vendor's login page" do
        get :index
        expect(response).to redirect_to(new_vendor_session_path)
      end

      it 'return with status 302' do
        get :index
        expect(response.status).to eq(302)
      end
    end

    describe " GET 'new'" do

      it "should redirect to vendor's login page" do
        get :new
        expect(response).to redirect_to(new_vendor_session_path)
      end

      it 'return with status 302' do
        get :new
        expect(response.status).to eq(302)
      end
    end

    describe "POST 'create'" do

      it "should redirect to deal's login page" do
        post :create, {deal: FactoryGirl.attributes_for(:deal)}
        expect(response).to redirect_to(new_vendor_session_path)
      end

      it 'return with status 302' do
        post :create, {deal: FactoryGirl.attributes_for(:deal)}
        expect(response.status).to eq(302)
      end
    end

    describe "DELETE 'destroy' " do
      it 'return with status 302' do
        delete :destroy, {id: 1}
        expect(response.status).to eq(302)
      end

      it 'renders the admins login lemplate' do
        delete :destroy, {id: 1}
        expect(response).to redirect_to(new_vendor_session_path)
      end
    end

    describe "GET 'edit'" do

      it 'return with status 302' do
        post :edit, {id: 1}
        expect(response.status).to eq(302)
      end

      it 'renders the admins login lemplate' do
        post :edit, {id: 1}
        expect(response).to redirect_to(new_vendor_session_path)
      end
    end
  end

end

require 'spec_helper'

RSpec.describe VendorsController, :type => :controller do

  describe "response of action's for authenticated vendor" do
    before do
      @current_vendor = FactoryGirl.create(:vendor)
      sign_in @current_vendor
    end

    describe "GET 'dashboard'" do

      it "returns http success" do
        get :dashboard
        expect(response).to be_success
      end

      it "renders the dashboard template" do
        get :dashboard
        expect(response).to render_template('dashboard')
      end

      it 'return with status 200' do
        get :dashboard
        expect(response.status).to eq(200)
      end
    end
  end

  describe "response of page's without login" do

    describe 'response of dashboard page' do
      it 'return with status 302' do
        get :dashboard
        expect(response.status).to eq(302)
      end

      it 'renders the users login page' do
        get :dashboard
        expect(response).to redirect_to(new_vendor_session_path)
      end
    end
  end

end

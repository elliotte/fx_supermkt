require 'spec_helper'

feature 'Customer Section', type: :request do

  context 'login Customer' do
    before do
      login_customer
    end

    it 'must be land on dashboard' do
      expect(current_path).to eq(customers_dashboard_path)
    end

    it 'must have log out link' do
      expect(page).to have_link('Sign Out')
    end

    it 'must have welcome content' do
      expect(page).to have_content("Welcome #{@current_customer.email}")
    end
  end
end

require 'spec_helper'

feature 'Vendor Section', type: :request do

  context 'login Vendor' do
    before do
      login_vendor
    end

    it 'must be land on dashboard' do
      expect(current_path).to eq(vendors_dashboard_path)
    end

    it 'must have log out link' do
      expect(page).to have_link('Sign Out')
    end

    it 'must have welcome content' do
      expect(page).to have_content("Welcome #{@current_vendor.email}")
    end

  end
end

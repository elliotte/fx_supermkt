require 'spec_helper'

feature "Deals", :type => :request do

  context "for authenticated vendors" do
    before do
      login_vendor
    end

    it "Deals start with index Page" do
      visit vendors_deals_path
      expect(page).to have_content('Listing Deals')
      expect(page).to have_link('New Deal')

      click_link('New Deal')
      expect(current_path).to eq(new_vendors_deal_path)
      fill_in :deal_sell_currency, with: "USD"
      fill_in :deal_buy_currency, with: "INR"
      fill_in :deal_rate, with: 9.36
      click_button('Create Deal')
      expect(page).to have_content('Deal Created Successfully.')
      expect(current_path).to eq(vendors_deal_path(Deal.last))
      click_link('Edit')
      expect(current_path).to eq(edit_vendors_deal_path(Deal.last))
      click_button('Update Deal')
      expect(current_path).to eq(vendors_deal_path(Deal.last))
      expect(page).to have_content('Deal updated Successfully.')
      expect(page).to have_link('Back')
      click_link('Back')
      expect(current_path).to eq(vendors_deals_path)
      click_link('Destroy')
      expect(page).to have_content('Deal Deleted Successfully.')
    end

    it 'shows validation errors on invalid form submission' do
      visit vendors_deals_path
      expect(page).to have_content('Listing Deals')
      expect(page).to have_link('New Deal')

      click_link('New Deal')
      click_button('Create Deal')
      expect(page).to have_content("Sell currency can\'t be blank")
      expect(page).to have_content("Buy currency can\'t be blank")
      expect(page).to have_content("Rate can\'t be blank")
    end
  end
end

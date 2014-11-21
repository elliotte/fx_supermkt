require 'rails_helper'

feature "Purchase", :type => :request do

  context "for authenticated customer" do
    before do
      login_customer
      FactoryGirl.create(:deal)
    end

    it "Purchase start with index Page" do
      visit customers_dashboard_path
      expect(page).to have_link('Purchase Deal')

      click_link('Purchase Deal')
      expect(current_path).to eq(new_customers_purchase_path)
      fill_in :purchase_amount, with: 9.36
      click_button('Create Purchase')
      binding.pry
      expect(page).to have_content('Deal purchase successfully.')
      purchase = Purchase.last
      expect(current_path).to eq(customers_purchase_path(purchase))
      click_link('Edit')
      expect(current_path).to eq(edit_customers_purchase_path(purchase))
      click_button('Update Purchase')
      expect(current_path).to eq(customers_purchase_path(purchase))
      expect(page).to have_content('Purchase deal updated successfully.')
      expect(page).to have_link('Back')
      click_link('Back')
      expect(current_path).to eq(customers_purchases_path)
      click_link('Destroy')
      expect(page).to have_content('Purchase deal deleted successfully.')
    end

    it 'shows validation errors for invalid form submit' do
      visit customers_purchases_path
      expect(page).to have_content('Listing Customers Purchases')
      expect(page).to have_link('New Purchase')

      click_link('New Purchase')
      click_button('Create Purchase')
      expect(page).to have_content("Amount can\'t be blank")
    end
  end
end

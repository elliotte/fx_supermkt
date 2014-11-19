module Login

  module Customer
    # this method creates a customer login for request spec.
    def login_customer
      @current_customer = FactoryGirl.create(:customer)
      visit new_customer_session_path
      fill_in 'customer_email', with: @current_customer.email
      fill_in 'customer_password', with: '123456789'
      #HACK: to blur the fields to enable the Sign In button when js:true
      fill_in 'customer_email', with: @current_customer.email
      click_button 'Log in'
    end
  end

  module Vendor

    # this method creates a vendor login for request spec.
    def login_vendor
      @current_vendor = FactoryGirl.create(:vendor)
      visit new_vendor_session_path
      fill_in 'vendor_email', with: @current_vendor.email
      fill_in 'vendor_password', with: '123456789'
      #HACK: to blur the fields to enable the Sign In button when js:true
      fill_in 'vendor_email', with: @current_vendor.email
      click_button 'Log in'
    end
  end

end

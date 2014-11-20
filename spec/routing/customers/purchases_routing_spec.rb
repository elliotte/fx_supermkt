require "rails_helper"

RSpec.describe Customers::PurchasesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/customers/purchases").to route_to("customers/purchases#index")
    end

    it "routes to #new" do
      expect(:get => "/customers/purchases/new").to route_to("customers/purchases#new")
    end

    it "routes to #show" do
      expect(:get => "/customers/purchases/1").to route_to("customers/purchases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/customers/purchases/1/edit").to route_to("customers/purchases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/customers/purchases").to route_to("customers/purchases#create")
    end

    it "routes to #update" do
      expect(:put => "/customers/purchases/1").to route_to("customers/purchases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/customers/purchases/1").to route_to("customers/purchases#destroy", :id => "1")
    end

  end
end

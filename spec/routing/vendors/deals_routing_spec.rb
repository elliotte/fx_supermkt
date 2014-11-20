require "rails_helper"

RSpec.describe Vendors::DealsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vendors/deals").to route_to("vendors/deals#index")
    end

    it "routes to #new" do
      expect(:get => "/vendors/deals/new").to route_to("vendors/deals#new")
    end

    it "routes to #show" do
      expect(:get => "/vendors/deals/1").to route_to("vendors/deals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vendors/deals/1/edit").to route_to("vendors/deals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/vendors/deals").to route_to("vendors/deals#create")
    end

    it "routes to #update" do
      expect(:put => "/vendors/deals/1").to route_to("vendors/deals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vendors/deals/1").to route_to("vendors/deals#destroy", :id => "1")
    end

  end
end

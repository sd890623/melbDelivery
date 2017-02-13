require "rails_helper"

RSpec.describe OrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shops/1/orders").to route_to("orders#index", :shop_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/shops/1/orders/new").to route_to("orders#new", :shop_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/shops/1/orders/1").to route_to("orders#show", :id => "1", :shop_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shops/1/orders").to route_to("orders#create", :shop_id => "1")
    end
  end
end

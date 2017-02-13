require "rails_helper"

RSpec.describe ItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shops/1/items").to route_to("items#index", :shop_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/shops/1/items/new").to route_to("items#new", :shop_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/shop/items/1").to route_to("items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shop/items/1/edit").to route_to("items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shops/1/items").to route_to("items#create", :shop_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shop/items/1").to route_to("items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shop/items/1").to route_to("items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shop/items/1").to route_to("items#destroy", :id => "1")
    end

  end
end

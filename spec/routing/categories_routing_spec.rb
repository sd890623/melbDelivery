require "rails_helper"

RSpec.describe CategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shops/1/categories").to route_to("categories#index", :shop_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/shops/1/categories/new").to route_to("categories#new", :shop_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/shops/1/categories/1").to route_to("categories#show", :id => "1", :shop_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shops/1/categories/1/edit").to route_to("categories#edit", :id => "1", :shop_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shops/1/categories").to route_to("categories#create", :shop_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shops/1/categories/1").to route_to("categories#update", :id => "1", :shop_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shops/1/categories/1").to route_to("categories#update", :id => "1", :shop_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shops/1/categories/1").to route_to("categories#destroy", :id => "1", :shop_id => "1")
    end

  end
end

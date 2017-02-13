require "rails_helper"

RSpec.describe ReviewsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shops/1/reviews").to route_to("reviews#index", :shop_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/shops/1/reviews/new").to route_to("reviews#new", :shop_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/shops/1/reviews/1").to route_to("reviews#show", :id => "1", :shop_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shops/1/reviews/1/edit").to route_to("reviews#edit", :id => "1", :shop_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shops/1/reviews").to route_to("reviews#create", :shop_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shops/1/reviews/1").to route_to("reviews#update", :id => "1", :shop_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shops/1/reviews/1").to route_to("reviews#update", :id => "1", :shop_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shops/1/reviews/1").to route_to("reviews#destroy", :id => "1", :shop_id => "1")
    end

  end
end

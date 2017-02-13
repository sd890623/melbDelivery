require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "GET /shops/1/reviews" do
    it "works! (now write some real specs)" do
      shop = create :shop
      review = create :review, shop: shop
      get shop_reviews_path(shop_id: shop.id)
      expect(response).to have_http_status(200)
    end
  end
end

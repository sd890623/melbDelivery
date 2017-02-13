require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "POST /shops/1/orders" do
    it "creates an order" do
      shop = FactoryGirl.create :shop
      item = create :item, shop: shop
      headers = { "CONTENT_TYPE" => "application/json" }
      payload = {
        cart: [{
          item_id: 1,
          quantity: 2
        }, {
          item_id:4,
          quantity: 1
        }],
        order: {
          phone: "0412345678",
          address: "275 King St Melbourne",
          delivery_time: "as_soon_as_possible",
          delivery_method: "delivery",
          delivery_fee: 50.0,
          total_fee: 60.0,
          note: "",
        }
      }.to_json
      post '/shops/1/orders', params: payload, headers: headers
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /shops/1/order" do
    it "builds an order" do
      shop = create :shop
      expect = {
          delivery_options: ['self', 'delivery']
      }

      get '/shops/1/order.json'

      expect(response.body).to eq expect.to_json
    end
  end
end

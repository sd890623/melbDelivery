require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /shops/1/items.json" do
    it "returns items" do
      shop = FactoryGirl.create :shop
      category = FactoryGirl.create :category, shop: shop
      item = FactoryGirl.create :item, shop: shop, category: category

      get '/shops/1/items.json'
      json = JSON.parse(response.body)
      expected =
        { items: [
          {
            id: 1,
            shop_id: 1,
            name: 'MyString',
            description: nil,
            price: 10.5,
            stock: 999,
            image: {
              url: nil
            },
            url: 'http://www.example.com/shop/items/1'
          }]
        }

      expect(json).to eq expected.as_json
    end
  end
end

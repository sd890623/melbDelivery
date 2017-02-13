require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /shops/1/categories/1.json" do
    it "returns items" do
      shop = FactoryGirl.create :shop
      category = FactoryGirl.create :category, shop: shop
      item1 = FactoryGirl.create :item, shop: shop, category: category
      item2 = FactoryGirl.create :item, shop: shop, category: category

      get '/shops/1/categories/1.json'
      json = JSON.parse(response.body)
      expected = {
        id: 1,
        name: 'MyString',
        description: nil,
        url: 'http://www.example.com/shops/1/categories/1.json',
        items: [{
          id: 1,
          name: 'MyString',
          description: nil,
          price: 10.5,
          stock: 999,
          image: {
            url: nil
          },
          url: 'http://www.example.com/shop/items/1'
        },
        {
          id: 2,
          name: 'MyString',
          description: nil,
          price: 10.5,
          stock: 999,
          image: {
            url: nil
          },
          url: 'http://www.example.com/shop/items/2'
        }]
      }

      expect(json).to eq expected.as_json
    end
  end
end

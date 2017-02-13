require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:shop) { FactoryGirl.create :shop }
  let(:category) { FactoryGirl.create :category, shop: shop }
  let(:item1) { create :item, shop: shop }
  let(:item2) { create :item, shop: shop }
  let(:order) { FactoryGirl.create :order, shop: shop }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns my orders as @orders" do
      get :index, params: {shop_id: shop.id}, session: valid_session
      expect(assigns(:orders)).to eq([order])
    end
  end
end

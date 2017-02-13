require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  let(:shop) { FactoryGirl.create :shop }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all reviews as @reviews" do
      review = create :review, shop: shop
      get :index, params: {shop_id: shop.to_param}, session: valid_session
      expect(assigns(:reviews)).to eq([review])
    end
  end
end

require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    shop = create :shop
    assign(:shop, shop)
    assign(:reviews, [
      create(:review, shop: shop),
      create(:review, shop: shop)
    ])
  end

  it "renders a list of reviews" do
    render
  end
end

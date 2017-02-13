require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    shop = create :shop
    assign(:shop, shop)
    assign(:review, create(:review, shop: shop))
  end

  it "renders new review form" do
    render
  end
end

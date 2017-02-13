require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    shop = create :shop

    assign(:shop, shop)
    assign(:categories, [
      create(:category, shop: shop),
      create(:category, shop: shop)
    ])
  end

  it "renders a list of categories" do
    render
  end
end

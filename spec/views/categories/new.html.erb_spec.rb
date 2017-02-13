require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    shop = create :shop
    category = create(:category, shop: shop)
    assign(:shop, shop)
    assign(:category, category)
  end

  it "renders new category form" do
    render
  end
end

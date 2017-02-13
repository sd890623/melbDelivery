require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    shop = create :shop
    @category = assign(:category, create(:category, shop: shop))
  end

  it "renders attributes in <p>" do
    render
  end
end

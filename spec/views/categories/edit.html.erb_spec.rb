require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    shop = create :shop
    @category = assign(:category, create(:category, shop: shop))
  end

  it "renders the edit category form" do
    render
  end
end

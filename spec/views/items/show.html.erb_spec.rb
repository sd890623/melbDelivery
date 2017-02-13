require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    shop = create :shop, :with_item
    @item = assign :item, shop.items.first
  end

  it "renders successfully" do
    render
  end
end

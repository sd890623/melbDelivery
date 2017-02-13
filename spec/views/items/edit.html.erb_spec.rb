require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    shop = create :shop, :with_item
    @item = assign :item, shop.items.first
  end

  it "renders the edit item form" do
    render
  end
end

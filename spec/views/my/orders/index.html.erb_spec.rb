RSpec.describe "my/orders/index", type: :view do
  before(:each) do
    shop = create :shop
    assign(:shop, shop)
    assign(:orders, [
      create(:order, shop: shop),
      create(:order, shop: shop)
    ])
  end

  it "renders a list of reviews" do
    render
  end
end

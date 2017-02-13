require 'rails_helper'

RSpec.describe "shops/edit", type: :view do
  before(:each) do
    @shop = assign(:shop, create(:shop))
  end

  it "renders the edit shop form" do
    render
  end
end

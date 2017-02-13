require 'rails_helper'

RSpec.describe "shops/show", type: :view do
  before(:each) do
    @shop = assign(:shop, create(:shop))
  end

  it "renders attributes in <p>" do
    render
  end
end

require 'rails_helper'

RSpec.describe "shops/new", type: :view do
  before(:each) do
    assign(:shop, build(:shop))
  end

  it "renders new shop form" do
    render
  end
end

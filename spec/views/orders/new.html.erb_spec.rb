require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, build(:order))
  end

  it "renders new shop form" do
    render
  end
end

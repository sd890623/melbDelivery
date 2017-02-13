require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, create(:review))
  end

  it "renders the edit review form" do
    render
  end
end

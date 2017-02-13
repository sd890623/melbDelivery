require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ReviewsController, type: :controller do

  let(:shop) { FactoryGirl.create :shop }

  # This should return the minimal set of attributes required to create a valid
  # Review. As you add validations to Review, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      time: "2017-01-17 23:25:00",
      rating: 1,
      comment: "MyText",
      shop_id: shop.id
    }
  }

  let(:invalid_attributes) {
    {
      time: "2017-01-17 23:25:00",
      rating: 1,
      comment: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReviewsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all reviews as @reviews" do
      review = Review.create! valid_attributes
      get :index, params: {shop_id: shop.to_param}, session: valid_session
      expect(assigns(:reviews)).to eq([review])
    end
  end

  describe "GET #show" do
    it "assigns the requested review as @review" do
      review = Review.create! valid_attributes
      get :show, params: {shop_id: shop.to_param, id: review.to_param}, session: valid_session
      expect(assigns(:review)).to eq(review)
    end
  end

  describe "GET #new" do
    it "assigns a new review as @review" do
      get :new, params: {shop_id: shop.to_param}, session: valid_session
      expect(assigns(:review)).to be_a_new(Review)
    end
  end

  describe "GET #edit" do
    it "assigns the requested review as @review" do
      review = Review.create! valid_attributes
      get :edit, params: {shop_id: shop.to_param, id: review.to_param}, session: valid_session
      expect(assigns(:review)).to eq(review)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Review" do
        expect {
          post :create, params: {shop_id: shop.to_param, review: valid_attributes}, session: valid_session
        }.to change(Review, :count).by(1)
      end

      it "assigns a newly created review as @review" do
        post :create, params: {shop_id: shop.to_param, review: valid_attributes}, session: valid_session
        expect(assigns(:review)).to be_a(Review)
        expect(assigns(:review)).to be_persisted
      end

      it "redirects to the created review" do
        post :create, params: {shop_id: shop.to_param, review: valid_attributes}, session: valid_session
        expect(response).to redirect_to([shop, Review.last])
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved review as @review" do
        post :create, params: {shop_id: shop.to_param, review: invalid_attributes}, session: valid_session
        expect(assigns(:review)).to be_a_new(Review)
      end

      it "re-renders the 'new' template" do
        post :create, params: {shop_id: shop.to_param, review: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          comment: 'new comment'
        }
      }

      it "updates the requested review" do
        review = create :review, shop: shop
        put :update, params: {shop_id: shop.to_param, id: review.to_param, review: new_attributes}, session: valid_session
        review.reload
        expect(review.comment).to eq new_attributes[:comment]
      end

      it "assigns the requested review as @review" do
        review = create :review, shop: shop
        put :update, params: {shop_id: shop.to_param, id: review.to_param, review: valid_attributes}, session: valid_session
        expect(assigns(:review)).to eq(review)
      end

      it "redirects to the review" do
        review = create :review, shop: shop
        put :update, params: {shop_id: shop.to_param, id: review.to_param, review: valid_attributes}, session: valid_session
        expect(response).to redirect_to([shop, review])
      end
    end

    context "with invalid params" do
      it "assigns the review as @review" do
        review = create :review, shop: shop
        put :update, params: {shop_id: shop.to_param, id: review.to_param, review: invalid_attributes}, session: valid_session
        expect(assigns(:review)).to eq(review)
      end

      it "re-renders the 'edit' template" do
        review = create :review, shop: shop
        put :update, params: {shop_id: shop.to_param, id: review.to_param, review: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested review" do
      review = create :review, shop: shop
      expect {
        delete :destroy, params: {shop_id: shop.to_param, id: review.to_param}, session: valid_session
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the reviews list" do
      review = create :review, shop: shop
      delete :destroy, params: {shop_id: shop.to_param, id: review.to_param}, session: valid_session
      expect(response).to redirect_to(shop_reviews_url)
    end
  end

end

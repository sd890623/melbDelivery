class OrdersController < ApplicationController
  before_action :set_shop, only: [:index, :new, :create]

  def index
    @orders = @shop.orders
  end

  def new
    @order = @shop.orders.new
  end

  def show
    @order = Order.find params[:id]
  end

  def create
    @order = @shop.orders.new order_params

    respond_to do |format|
      if @order.save
        @order.add_items params[:cart]

        format.html { redirect_to [@shop, @order], notice: '订餐成功' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def order_params
    params.require(:order).permit(:phone, :address, :delivery_time, :delivery_method, :delivery_fee,
                                  :total_fee)
  end
end

class OrdersController < ApplicationController
  def index
    page = params[:page].to_i
    page = 1 if page <= 0
    per_page = params[:per_page].to_i
    per_page = 10 if per_page <= 0
    @orders = Order.includes(:order_delivery_info, :order_payment_info).paginate(page: page, per_page: per_page)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create_order(params: {menu_item_id: params[:menu_item_id]}.merge(order_params).with_indifferent_access)
    redirect_to @order
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params.merge(menu_item_id: params[:menu_item_id]))
      redirect_to @order
    else
      render 'edit'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def new
  end
  private

  def order_params
    keys = [:menu_item_id, :customer_id, :quantity, :order_placed_type] + ::CustomerInfo::KEYS
    params.require(:order).permit(keys)
  end
end

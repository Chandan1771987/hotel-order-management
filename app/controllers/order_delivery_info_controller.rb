class OrderDeliveryInfoController < ApplicationController
  def index
    page = params[:page].to_i
    page = 1 if page <= 0
    per_page = params[:per_page].to_i
    per_page = 10 if per_page <= 0
    @items = OrderDeliveryInfo.paginate(page: page, per_page: per_page)
  end

  def show
    @item = OrderDeliveryInfo.find(params[:id])
  end

  def create
    @item = OrderDeliveryInfo.create!(order_delivery_info_params)
    redirect_to @item
  end

  def destroy
    @item = OrderDeliveryInfo.find(params[:id])
    @item.destroy
    redirect_to order_delivery_infos_path
  end

  def update
    @item = OrderDeliveryInfo.find(params[:id])
    if @item.update(order_delivery_info_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def edit
    @item = OrderDeliveryInfo.find(params[:id])
  end

  def new
  end

  private
  def order_delivery_info_params
    order_delivery_info_params.require(:order_delivery_info).permit(:order_id, :status)
  end
end

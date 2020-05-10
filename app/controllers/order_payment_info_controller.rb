class OrderPaymentInfoController < ApplicationController
  def index
    page = params[:page].to_i
    page = 1 if page <= 0
    per_page = params[:per_page].to_i
    per_page = 10 if per_page <= 0
    @items = OrderPaymentInfo.paginate(page: page, per_page: per_page)
  end

  def show
    @item = OrderPaymentInfo.find(params[:id])
  end

  def create
    @item = OrderPaymentInfo.create!(order_payment_info_params)
    redirect_to @item
  end

  def destroy
    @item = OrderPaymentInfo.find(params[:id])
    @item.destroy
    redirect_to order_payment_infos_path
  end

  def update
    @item = OrderPaymentInfo.find(params[:id])
    if @item.update(order_payment_info_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def edit
    @item = OrderPaymentInfo.find(params[:id])
  end

  def new
  end

  private
  def order_payment_info_params
    params.require(:order_payment_info).permit(:order_id, :payment, :status, :transaction_id)
  end
end

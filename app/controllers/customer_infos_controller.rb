class CustomerInfosController < ApplicationController
  def index
    page = params[:page].to_i
    page = 1 if page <= 0
    per_page = params[:per_page].to_i
    per_page = 10 if per_page <= 0
    @items = CustomerInfo.paginate(page: page, per_page: per_page)
  end

  def show
    @item = CustomerInfo.find(params[:id])
  end

  def create
    @item = CustomerInfo.create!(customer_infos_params)
    redirect_to @item
  end

  def destroy
    @item = CustomerInfo.find(params[:id])
    @item.destroy
    redirect_to customer_infos_path
  end

  def update
    @item = CustomerInfo.find(params[:id])
    if @item.update(customer_infos_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def edit
    @item = CustomerInfo.find(params[:id])
  end

  def new
  end

  private
  def customer_infos_params
    params.require(:customer_info).permit(:CustomerInfo::KEYS)
  end
end

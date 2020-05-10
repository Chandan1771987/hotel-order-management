class MenuItemsController < ApplicationController
  def index
    page = params[:page].to_i
    page = 1 if page <= 0
    per_page = params[:per_page].to_i
    per_page = 10 if per_page <= 0
    @items = MenuItem.paginate(page: page, per_page: per_page)
  end

  def show
    @item = MenuItem.find(params[:id])
  end

  def create
    @item = MenuItem.create!(menu_item_params)
    redirect_to @item
  end

  def destroy
    @item = MenuItem.find(params[:id])
    @item.destroy
    redirect_to menu_items_path
  end

  def update
    @item = MenuItem.find(params[:id])
    if @item.update(menu_item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def edit
    @item = MenuItem.find(params[:id])
  end

  def new
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :avatar)
  end
end

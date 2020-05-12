class MenuItemsController < ApplicationController
  def index
    page = params[:page].to_i
    page = 1 if page <= 0
    per_page = params[:per_page].to_i
    per_page = 10 if per_page <= 0
    @items = MenuItem
    @items = @items.where("name like ?", "%#{params[:name]}%") if params[:name].present?
    @items = @items.paginate(page: page, per_page: per_page)
    count = @items.size
    more = page * per_page < count
    respond_to do |format|
      format.html { render 'index'}
      format.json { render json: {result: true, items: @items.map(&:web_json), more: more, count: count} }
    end
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

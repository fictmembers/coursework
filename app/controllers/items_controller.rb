class ItemsController < ApplicationController

  def new
    @item = Item.new()
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save

    redirect_to items_path

  end

  def show
    @item = Item.find(params[:id])
    @cuisine = Menu.find(@item.menu_id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to items_path
    else
        render 'edit'
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def item_params
    params.require(:item).permit(:price, :description, :menu_id, :restaurant_id)
  end

end

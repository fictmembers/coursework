class ItemsController < ApplicationController

  def new
  @item = Item.new()
  end

  def index
  @item = Item.all
  end

  def create
  @item = Item.new(item_params)
  end

  def show
  @item = Item.find(params[:id])
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
  params.require(:item).permit(:PRICE, :DESCRIPTION)
  end

end

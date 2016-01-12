class MenusController < ApplicationController
  before_action :signed_in_administrator, only:
          [:new, :index, :edit, :update, :destory]

  def new
    @menu = Menu.new
  end

  def index
    @menus = Menu.where(lang:I18n.locale)
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save

    redirect_to menus_path
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])

    if @menu.update_attributes(menu_params)
      redirect_to menus_path
    else
      render 'edit'
    end
  end

  def destroy
    Menu.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def menu_params
    params.require(:menu).permit(:cuisine, :restaurant_id)
  end
end

class HostessesController < ApplicationController

  def new
  @hostess = Hostess.new()
  end

  def index
  @hostess = Hostess.all
  end

  def create
  @hostess = Hostess.new(hostess_params)
  end

  def show
  @hostess = Hostess.find(params[:id])
  end

  def edit
  @hostess = Hostess.find(params[:id])
  end

  def update
  @hostess = Hostess.find(params[:id])

  if @hostess.update_attributes(hostess_params)
    redirect_to hostesss_path
  else
      render 'edit'
  end
  end

  def destroy
  Hostess.find(params[:id]).destroy
  redirect_to :back
  end

  private

  def hostess_params
  params.require(:hostess).permit(:NAME)
  end

end

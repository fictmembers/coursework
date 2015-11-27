class TablesController < ApplicationController

  def new
  @table = Table.new()
end

def index
  @table = Table.all
end

def create
  @table = Table.new(table_params)
end

def show
  @table = Table.find(params[:id])
end

def edit
  @table = Table.find(params[:id])
end

def update
  @table = Table.find(params[:id])

  if @table.update_attributes(table_params)
    redirect_to tables_path
  else
      render 'edit'
  end
end

def destroy
  Table.find(params[:id]).destroy
  redirect_to :back
end

private

def table_params
  params.require(:table).permit(:VISNUMBER, :STATUS)
end

end

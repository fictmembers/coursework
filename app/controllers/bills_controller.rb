class BillsController < ApplicationController

  def new
  @bill = Bill.new()
end

def index
  @bill = Bill.all
end

def create
  @bill = Bill.new(bill_params)
end

def show
  @bill = Bill.find(params[:id])
end

def edit
  @bill = Bill.find(params[:id])
end

def update
  @bill = Bill.find(params[:id])

  if @bill.update_attributes(bill_params)
    redirect_to bills_path
  else
      render 'edit'
  end
end

def destroy
  Bill.find(params[:id]).destroy
  redirect_to :back
end

private

def bill_params
  params.require(:bill).permit(:CREATED, :OPTIONS, :SUMMARY)
end

end

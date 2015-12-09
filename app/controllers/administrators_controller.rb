class AdministratorsController < ApplicationController
  before_action :signed_in_administrator, only:
          [:new, :index, :show, :edit, :update, :topwaiters, :panel, :destory]
  def new
    @administrator = Administrator.new
  end

  def index
    @administrators = Administrator.all
  end

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      sign_in @administrator
      redirect_to controlpanel_path
    else
      render 'new'
    end
  end

  def show
    @administrator = Administrator.find(params[:id])
  end

  def edit
    @administrator = Administrator.find(params[:id])
  end

  def update
    @administrator = Administrator.find(params[:id])

    if @administrator.update_attributes(administrator_params)
      redirect_to administrators_path
    else
      render 'edit'
    end
  end

  def topwaiters
    @waiters = Waiter.find_by_sql(["
      SELECT WAITERS.LASTNAME,
             ORDERS_PCS AS ORDERS_NUMBER
      FROM WAITERS
      INNER JOIN
        ( SELECT WAITER_ID,
                 COUNT(ID) AS ORDERS_PCS
         FROM ORDERS
         GROUP BY WAITER_ID
         ORDER BY ORDERS_PCS DESC) AS RAITING ON WAITERS.ID = RAITING.WAITER_ID;
    "])

    @chefs = Chef.find_by_sql(["
      SELECT CHEFS.LASTNAME,
             ORDERS_PCS
      FROM CHEFS
      INNER JOIN
        ( SELECT CHEF_ID,
                 COUNT(ID) AS ORDERS_PCS
         FROM ORDERS
         GROUP BY CHEF_ID
         ORDER BY ORDERS_PCS DESC) AS RAITING ON CHEFS.ID = RAITING.CHEF_ID;
    "])
  end

  def panel
  end

  def destroy
    Administrator.find(params[:id]).destroy
    redirect_to :back
  end

  def landing
  end

  private

  def administrator_params
    params.require(:administrator).permit(:login, :password, :password_confirmation)
  end
end

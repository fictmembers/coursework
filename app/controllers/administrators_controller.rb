class AdministratorsController < ApplicationController
  before_action :signed_in_administrator, only:
          [:new, :index, :show, :edit, :update, :topwaiters, :panel, :destory, :lastweektop]
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

  def lastweektop
    @top = Item.find_by_sql(["
      SELECT ITEMS.DESCRIPTION AS ITEMDESC,
             RAWDATA.NUMBER_OF_PARTS AS VAL,
             (ITEMS.PRICE * RAWDATA.NUMBER_OF_PARTS) AS PROFIT
      FROM ITEMS
      INNER JOIN
        (SELECT PARTS.ITEM_ID AS ITEM_ORDERED,
                COUNT(PARTS.ID) AS NUMBER_OF_PARTS
         FROM PARTS
         WHERE PARTS.CREATED_AT::DATE BETWEEN NOW()::DATE - 7 AND NOW()::DATE
         GROUP BY PARTS.ITEM_ID
         ORDER BY NUMBER_OF_PARTS DESC) AS RAWDATA ON RAWDATA.ITEM_ORDERED = ITEMS.ID
      "])
    @cost = 0
    @top.each do |f|
      @cost += f.profit
    end
  end

  def alldayslong
    @rating = Restaurant.find_by_sql(["
      SELECT RESTAURANTS.NAME AS RESTNAME,
        SUM(TABLEDATA.RESERVATIONS_NUMBER) AS TOTAL,
        TABLEDATA.DAY_NUMBER AS RESTDAY
      FROM RESTAURANTS
      INNER JOIN (
      SELECT TABLES.RESTAURANT_ID AS REST_ID, DAYDATA.RES_NUM AS RESERVATIONS_NUMBER, DAYDATA.MIMEDAY AS DAY_NUMBER, DAYDATA.TABNUM AS TABLE_NUM
        FROM TABLES
        INNER JOIN (SELECT COUNT(RESERVATIONS.ID) AS RES_NUM, EXTRACT(DOW FROM RESERVATIONS.RESERV_TIME) AS MIMEDAY, RESERVATIONS.TABLE_ID AS TABNUM
            FROM RESERVATIONS
            GROUP BY EXTRACT(DOW FROM RESERVATIONS.RESERV_TIME), RESERVATIONS.TABLE_ID
            ORDER BY EXTRACT(DOW FROM RESERVATIONS.RESERV_TIME) DESC) AS DAYDATA
        ON TABLES.ID = DAYDATA.TABNUM
        ) AS TABLEDATA
      ON RESTAURANTS.ID = TABLEDATA.REST_ID
      GROUP BY TABLEDATA.DAY_NUMBER, RESTAURANTS.NAME
      ORDER BY TABLEDATA.DAY_NUMBER
      "])
  end

  private

  def administrator_params
    params.require(:administrator).permit(:login, :password, :password_confirmation)
  end
end

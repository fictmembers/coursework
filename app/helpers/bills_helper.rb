module BillsHelper
  def cashier_select
    @cashiers = Cashier.find_by_sql('
                               SELECT CASHIERS."LASTNAME" AS c_name,
                                      CASHIERS.id       AS c_id,
                                      RESTAURANTS.name   AS r_name
                               FROM CASHIERS
                               INNER JOIN RESTAURANTS
                               ON RESTAURANTS.id = CASHIERS.restaurant_id')
    s = ''
    @cashiers.each do |cashier|
      s << "<option value=#{cashier.c_id}>#{cashier.c_name} (#{cashier.r_name})</option>"
    end
    s.html_safe
  end
end

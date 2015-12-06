module ReservationsHelper
  def table_select
    @tables = Table.find_by_sql('
      SELECT tables.id AS t_id,
             restaurants.name AS r_name
        FROM tables
        INNER JOIN restaurants
        ON tables.restaurant_id = restaurants.id
    ')
    s = ''
    @tables.each do |table|
      s << "<option value=#{table.t_id}>Table №#{table.t_id} in #{table.r_name}</option>"
    end
    s.html_safe
  end

  def time_select
    @time = 07..17
    s = ''
    @time.each do |hour|
      s << "<option value=#{hour}>#{hour}:00</option>"
    end
    s.html_safe
  end
end

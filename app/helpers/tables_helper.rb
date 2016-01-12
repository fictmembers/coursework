module TablesHelper
  def waiter_select
    waiter = Waiter.where(lang:I18n.locale)

    s = ''
    waiter.each do |w|
      s << "<option value=#{w.id}>#{w.lastname}</option>"
    end
    s.html_safe
  end

  def table_select
    table = Table.find_by_sql('
         SELECT TABLES.ID AS TABLE_ID,
                RESTAURANTS.NAME AS RESTAURANT_NAME
         FROM TABLES
         INNER JOIN RESTAURANTS
         ON RESTAURANTS.ID = TABLES.RESTAURANT_ID')
    s = ''
    table.each do |t|
      s << "<option value=#{t.table_id}>#{t.restaurant_name} - Table ##{t.table_id}</option>"
    end
    s.html_safe
  end
end

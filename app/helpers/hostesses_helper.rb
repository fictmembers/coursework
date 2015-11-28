module HostessesHelper
  def hall_select
    job_place = Hall.find_by_sql('
    SELECT restaurants.id AS r_id,
           restaurants.name AS r_name,
           halls."id" AS h_id,
	         halls."HALL_TYPE" AS h_name
    FROM restaurants
    INNER JOIN halls
    ON halls.restaurant_id = restaurants.id')

    s = ''
    job_place.each do |job|
      s << "<option value=#{job.h_id}>#{job.r_name} - #{job.h_name}</option>"
    end
    s.html_safe
  end
end

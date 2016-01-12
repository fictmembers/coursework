module MessagesHelper
  def administrator_select
    @administrator = Administrator.find_by_sql('
                               SELECT ADMINISTRATORS.login AS c_name,
                                      ADMINISTRATORS.id AS c_id
                               FROM ADMINISTRATORS')
    s = ''
    @administrator.each do |member|
      s << "<option value=#{member.c_id}>@#{member.c_name}</option>"
    end
    s.html_safe
  end
end

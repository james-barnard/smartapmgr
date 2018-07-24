module ApplicationHelper
  def full_title(page_title = '')
    base_title = "NOKA SmarTap Manager Application"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def logged_in_as(user)
    role = user && user.try(:role)
    role ? "Logged In as role: #{role}" : "Not Logged In"
  end

  def std_date(date)
    date.strftime("%m/%d/%Y")
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end

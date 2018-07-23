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
end

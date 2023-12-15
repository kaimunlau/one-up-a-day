module ApplicationHelper
  def pretty_date_for(date)
    date.strftime('%B %e, %Y')
  end
end

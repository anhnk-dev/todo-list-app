module TaskHelper
  def display_task_priority(priority)
    "#{priority} priority".upcase
  end

  def due_date_with_format(date)
    date.strftime("%a, %d %b %Y, %l:%M%P")
  end
end

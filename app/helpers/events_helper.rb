module EventsHelper
  def joinable_event(user, event)
    if user == true && event.date_end >= Date.today
      1
    elsif user == 'Not registered' && event.date_end >= Date.today
      2
    elsif user == true && event.date_end < Date.today
      3
    else
      4
    end
  end
  
  def canceled_event(user, event)
    if user == true && event.date_end >= Date.today
      1
    elsif user == 'Not registered' && event.date_end >= Date.today
      2
    elsif user == true && event.date_end < Date.today
      3
    else
      4
    end
  end
end

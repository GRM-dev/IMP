module UsersHelper
  def is_online(user)
     user.last_seen > 5.minutes.ago 
  end
  
  def user_get_current_state(user)
    if is_online(user)
      return 1
    elsif user.last_seen > 10.minutes.ago 
      return 2
    else
      return 0
    end
  end
end

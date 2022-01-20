module ApplicationHelper

  def user_name(id)
    user = User.find(id)
    user.name
  end

end

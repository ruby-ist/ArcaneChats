class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :last_message, :user_name, :sorted_users, :new_message_nos

  def initialize
    @title = "ArcaneChats"
    @messages = Message.all
    @all_users = User.all
    super
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def user_name(id)
    user = @all_users[id - 1]
    user == current_user ? "You" : user.name
  end

  def convo_messages(id1, id2)
    @messages.filter{ |i| (i.user_id == id1  && i.send_to_id ==  id2) || (i.user_id == id2  && i.send_to_id == id1) }
  end

  def last_message(id)
    return nil unless current_user
    messages = convo_messages(id, current_user.id)
    messages.empty? ? nil : messages.last
  end

  def update_last_seen(curr_id, other_id)
    seen = Seen.find_or_create_by(user_id: curr_id, other_user_id: other_id)
    seen.update(last_seen: DateTime.current)
  end

  def sorted_users
    users = User.all.to_a - [current_user]
    users.sort_by{ |u| last_message_time(u.id) }.reverse
  end

  def new_message_nos (id)
    last_seen = current_user.seens.find_by(other_user_id: id).last_seen
    convo_messages(current_user.id,id).filter{ _1.created_at > last_seen}.size
  end

end


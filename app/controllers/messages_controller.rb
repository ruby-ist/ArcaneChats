class MessagesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    message = user.messages.new(content: params[:message][:content], user_id: params[:user_id], send_to_id: params[:send_to_id])
    if message.save
      update_last_seen params[:user_id], params[:send_to_id]
    end
    redirect_to user_path params[:send_to_id]
  end
end

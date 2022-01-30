class UsersController < ApplicationController

  before_action :authenticate_user , except: [:new, :create]

  def index
    @seens = current_user.seens
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(authenticated_params)
    if @user.save
      flash[:notice] = "User created Successfully!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      response do |format|
        format.turbo_stream
        format.html{ render :new}
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
    @messages = convo_messages current_user.id, @user.id
    @blocked = Seen.find_or_create_by(user: current_user, other_user: @user).blocked
    update_last_seen current_user.id, @user.id
  end

  def update_list
    render partial: 'users/users', locals: {seens: current_user.seens}
  end

  def toggle_block
    seen = Seen.find_or_create_by(user_id: current_user.id, other_user_id: params[:id])
    seen.blocked = seen.blocked.!
    seen.save
    redirect_to user_path(params[:id])
  end

  private

  def authenticate_user
    unless current_user
      flash[:notice] = "You must log in first!"
      redirect_to login_path
    end
  end

  def authenticated_params
    params.permit(:name,:password)
  end

  def last_message_time(id)
    m = last_message id
    m ? m.created_at : DateTime.new(2000,1,1)
  end

end

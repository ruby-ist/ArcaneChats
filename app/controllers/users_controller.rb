class UsersController < ApplicationController

  def index
    unless logged_in?
      flash[:notice] = "You must log in first!"
      redirect_to login_path
    end
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(authenticated_params)
    if @user.save
      flash[:notice] = "User created Successfully!"
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
    @messages = Message.where(user_id: current_user.id, send_to_id: @user.id).or(Message.where(user_id: @user.id, send_to_id: current_user.id))
  end


  private

  def authenticated_params
    params.require(:user).permit(:name,:password)
  end


end

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


  private

  def authenticated_params
    params.require(:user).permit(:name,:password)
  end


end

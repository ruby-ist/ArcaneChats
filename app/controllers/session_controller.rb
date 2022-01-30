class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully!!"
      redirect_to root_path
    else
      flash[:error] = "Invalid username or password!"
      respond_to do |format|
        format.turbo_stream
        format.html{render :new}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully!!"
    redirect_to login_path
  end

end

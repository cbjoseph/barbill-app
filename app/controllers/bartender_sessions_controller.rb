class BartenderSessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    bartender = Bartender.find_by(email: params[:email])
    if bartender && bartender.authenticate(params[:password])
      session[:bartender_id] = bartender.id
      flash[:success] = 'Successfully logged in!'
      redirect_to '/queue'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/bartender_login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/bartender_login'
  end
end

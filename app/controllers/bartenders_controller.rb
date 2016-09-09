class BartendersController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def index
    render 'index.html.erb'
  end

  def create
    bartender = Bartender.new(
      name: params[:name],
      email: params[:email],
      bar_id: params[:bar_id],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if bartender.save
      session[:bartender_id] = bartender.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/bartenders'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/bartender_signup'
    end
  end

end


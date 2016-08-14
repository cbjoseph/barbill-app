class BarsController < ApplicationController
  def index
    @bars = Bar.all
    render layout: 'homepage.html.erb'
  end

  def just_show_stadiums
    @bars = Bar.all
    render 'allstadiums.html.erb'
  end

  def new
    @bar = Bar.new
    render 'new.html.erb'
  end

  def create
    @bar = Bar.create(
      name: params[:name]
    )
    render 'index.html.erb'
  end

  def show
    @bar = Bar.find_by(id: params['id'])
    @drinks = Drink.where(bar_id: params['id'])
    render 'show.html.erb'
  end

end

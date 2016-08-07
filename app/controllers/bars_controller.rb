class BarsController < ApplicationController
  def index
    @bars = Bar.all
    render 'index.html.erb'
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

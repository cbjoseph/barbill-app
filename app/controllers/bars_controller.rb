class BarsController < ApplicationController
  def index
    @bars = Bar.all
    render 'index.html.erb'
  end
end

class HomeController < ApplicationController
  def index
    date_string = params[:start_date] || DateTime.now.to_s
    @start_date = DateTime.strptime( date_string, '%Y-%m-%d' )
    @photos = Photo.by_month( @start_date.strftime( "%Y"), @start_date.strftime( "%m") ).all
  end
end

class MoviesController < ApplicationController
  def index
    # check for blanks and 'asdfasdfasdf'
    # require 'pry'; binding.pry

    @movies = if params[:popular]
      MovieFacade.popular
    elsif params[:search].blank? || MovieFacade.search(params[:search]).empty?
      flash[:notice] = 'Invalid movie title. Try again.'
      redirect_to discover_index_path
    elsif params[:search]
      MovieFacade.search(params[:search])
    end
  end

  def show
    
  end
end

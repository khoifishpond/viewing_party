class MoviesController < ApplicationController
  def index
    @movies = if params[:search]
      MovieFacade.search(params[:search])
    else
      MovieFacade.popular
    end
  end

  def show
    
  end
end

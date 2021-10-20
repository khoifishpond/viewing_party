class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_by_id(params[:movie_id])
    @party = Party.new
  end

  def create
    party = Party.create!(party_params)
    if party.save
      params[:users].each do |user|
        PartyGuest.create(user_id: user, party_id: party.id)
      end
      PartyGuest.create(user: current_user, party: party)
      flash[:success] = "Viewing Party created sucessfully!"
      redirect_to dashboard_index_path
    else
      @movie = MovieFacade.movie_by_id(params[:movie_id])
      render new_party_path
      flash[:notice] = "Please try again!"
    end
  end

  private

  def party_params
    params.permit(:host_id, :movie_title, :date, :start_time, :duration)
  end
end

class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_by_id(params[:movie_id])
    @party = Party.new
  end

  def create
    # require 'pry'; binding.pry
    party = Party.create(party_params)
    if party.save && !params[:users].nil?
      params[:users].each do |user|
        PartyGuest.create(user_id: user, party_id: party.id)
      end
      PartyGuest.create(user: current_user, party: party)
      redirect_to dashboard_index_path
      flash[:success] = "Viewing Party created successfully!"
    else
      redirect_to new_party_path(movie_id: params[:movie_id])
    end
  end

  private

  def party_params
    params.permit(:host_id, :movie_title, :movie_id, :date, :start_time, :duration)
  end
end

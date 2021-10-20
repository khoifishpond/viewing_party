require 'rails_helper'

RSpec.describe Movie do
  it 'stores movie information as ruby objects' do
    VCR.use_cassette('movie_poros') do
      movie = MovieFacade.movie_by_id(238)

      expect(movie).to be_a Movie
      expect(movie.title).to be_a String
      expect(movie.id).to be_an Integer
      expect(movie.vote_average).to be_a Float
      expect(movie.runtime).to be_an Integer
      expect(movie.overview).to be_a String
    end
  end
end

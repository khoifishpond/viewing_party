require 'rails_helper'

describe 'movies index page' do
  it 'displays top 40 movies title and vote average' do
    VCR.use_cassette('top_40_movies_and_vote_average') do
      visit movies_path
      click_on 'Top 40 Movies'
      
      json_response = File.read('spec/fixtures/movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["movie_db_api"]}&language=en-US&page=1").
        # with(
        #   headers: {
        #   'Accept'=>'*/*',
        #   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        #   'User-Agent'=>'Faraday v0.15.4',
        #   'X-Api-Key'=>'opyjcKdEUKllG8P5V15kv3yKKbx1KwkGQwXbfCF3'
        #   }).
        to_return(status: 200, body: json_response)
      expect(page).to have_content("Dilwale Dulhania Le Jayenge")
    end
  end
end
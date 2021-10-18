require 'rails_helper'

RSpec.describe MovieDbService do
  it 'returns a list of 20 top rated movies by page number' do
    VCR.use_cassette('top_20_rated_movies_by_page') do      
      top_movies = MovieDbService.top_movies_by_page(1)

      expect(top_movies).to be_a(Array)
      expect(top_movies.first).to have_key(:id)
      expect(top_movies.first).to have_key(:title)
      expect(top_movies.first).to have_key(:overview)
      expect(top_movies.first).to have_key(:vote_average)
      expect(top_movies.first).to have_key(:poster_path)
      expect(top_movies.count).to eq(20)
    end
  end
end

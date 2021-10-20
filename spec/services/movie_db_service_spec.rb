require 'rails_helper'

RSpec.describe MovieDbService do
  describe 'top_movies_by_page' do
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

  describe 'search_movie' do
    it 'can retrieve movie by title, with page' do
      VCR.use_cassette('search_movie') do
        movies = MovieDbService.search_movie(1, 'Pulp Fiction')

        expect(movies).to be_an Array
        expect(movies.first).to be_a Hash
        expect(movies.first[:title]).to be_a String
        expect(movies.first[:title]).to eq('Pulp Fiction')
        expect(movies.count).to be <= 40
      end
    end
  end

  describe 'search_by_id' do
    it 'can retrieve movie by movie id' do
      VCR.use_cassette('search_movie_by_id') do
        movie = MovieDbService.search_by_id(238)

        expect(movie[:id]).to eq(238)
        expect(movie[:title]).to be_a String
        expect(movie[:title]).to eq('The Godfather')
      end
    end
  end

  describe 'reviews' do
    it 'can retrieve reviews of a movie' do
      VCR.use_cassette('reviews') do
        reviews = MovieDbService.reviews(238)

        expect(reviews).to be_a Hash
        expect(reviews[:results].first[:author]).to be_a String
        expect(reviews[:results].first[:content]).to be_a String
      end
    end
  end

  describe 'cast' do
    it 'can retrieve cast of a movie' do
      VCR.use_cassette('cast') do
        cast = MovieDbService.cast(238)

        expect(cast).to be_an Array
        expect(cast.first[:name]).to be_a String
        expect(cast.first[:character]).to be_a String
        expect(cast.count).to eq(10)
      end
    end
  end
end

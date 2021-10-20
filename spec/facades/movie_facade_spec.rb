require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'Class Methods' do
    describe 'Popular' do
      it 'generates a list of the top 40 movies' do
        VCR.use_cassette('popular_movies') do
          movies = MovieFacade.popular

          expect(movies).to be_an Array
          expect(movies.count).to eq(40)
          expect(movies.first).to be_a Movie
          expect(movies.first.title).to be_a String
          expect(movies.last.vote_average).to be_a Float
        end
      end
    end

    describe 'Search' do
      it 'can search for a movie by title' do
        VCR.use_cassette('search_by_title') do
          movies = MovieFacade.search('Pulp Fiction')

          expect(movies).to be_an Array
          expect(movies.first.title).to eq('Pulp Fiction')
          expect(movies.first.vote_average).to eq(8.5)
          expect(movies.count).to be <= 40
        end
      end
    end

    describe 'movie_by_id' do
      it 'can search for a movie by id' do
        VCR.use_cassette('search_by_id') do
          movie = MovieFacade.movie_by_id(278)

          expect(movie.id).to eq(278)
          expect(movie).to be_a Movie
        end
      end
    end

    describe 'reviews' do
      it 'can generate reviews / review details for each movie' do
        VCR.use_cassette('reviews') do
          reviews = MovieFacade.reviews(238)

          expect(reviews).to be_an Array
          expect(reviews.first.content).to be_a String
          expect(reviews.first.author).to be_a String
        end
      end
    end

    describe 'cast' do
      it 'lists the first 10 cast memebers and their character' do
        VCR.use_cassette('cast') do
          cast = MovieFacade.cast(238)

          expect(cast).to be_an Array
          expect(cast.count).to eq(10)
          expect(cast.first.name).to be_a String
          expect(cast.first.character).to be_a String
        end
      end
    end
  end
end

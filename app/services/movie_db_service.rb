class MovieDbService < ApiService
  BASE_URL = 'https://api.themoviedb.org'

  def self.top_movies_by_page(page)
    get_data("#{BASE_URL}/3/movie/top_rated?api_key=#{ENV["movie_db_api"]}&language=en-US&page=#{page}")[:results]
  end

  def self.search_movie(page, title)
    get_data("#{BASE_URL}/3/search/movie?language=en-US&page=#{page}&query=#{title}&api_key=#{ENV["movie_db_api"]}")[:results]
  end

  def self.search_by_id(id)
    get_data("#{BASE_URL}/3/movie/#{id}?api_key=#{ENV["movie_db_api"]}&language=en-US")
  end

  def self.reviews(id)
    get_data("#{BASE_URL}/3/movie/#{id}/reviews?api_key=#{ENV["movie_db_api"]}&language=en-US")
  end

  def self.cast(id)
    get_data("#{BASE_URL}/3/movie/#{id}/credits?api_key=#{ENV["movie_db_api"]}&language=en-US")[:cast][0..9]
  end
end

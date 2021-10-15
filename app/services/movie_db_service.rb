class MovieDbService < ApiService

  BASE_URL = 'https://api.themoviedb.org'

  def self.top_movies_by_page(page)
    get_data("#{BASE_URL}/3/movie/top_rated?api_key=#{ENV["movie_db_api"]}&language=en-US&page=#{page}")[:results]
  end

  def self.search_movie(page, title)
    get_data("#{BASE_URL}/3/search/movie?language=en-US&page=#{page}&query=#{title}&api_key=#{ENV["movie_db_api"]}")
  end

  # def top_40
  #   get_data("#{BASE_URL}/3/movie/top_rated?api_key=#{ENV["movie_db_api"]}&language=en-US&page=#{page}")
  # end

  # def popular_movies
  #   get_data("#{BASE_URL}/3/movie/popular?api_key=#{ENV['movie_db_api']}&language=en-US&page=1")
  # end
end

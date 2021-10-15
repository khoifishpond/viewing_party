class MovieDbService < ApiService

  BASE_URL = 'https://api.themoviedb.org'

  def top_20
    get_data("#{BASE_URL}/3/movie/top_rated?api_key=#{ENV["movie_db_api"]}&language=en-US&page=1")
  end

  def top_40
    get_data("#{BASE_URL}/3/movie/top_rated?api_key=#{ENV["movie_db_api"]}&language=en-US&page=2")
  end
end

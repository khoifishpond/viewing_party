class MovieFacade
  def self.popular
    json = MovieDbService.top_movies_by_page(1) + MovieDbService.top_movies_by_page(2)
    json.map do |result|
      Movie.new(result)
    end
  end

  def self.search(title)
    json = MovieDbService.search_movie(1, title) + MovieDbService.search_movie(2, title)
    json.map do |result|
      Movie.new(result)
    end
  end

  def self.movie_by_id(id)
    movie = MovieDbService.search_by_id(id)
    Movie.new(movie)
  end

  def self.reviews(id)
    reviews = MovieDbService.reviews(id)
    reviews[:results].map do |review|
      Review.new(review)
    end
  end

  def self.cast(id)
    cast = MovieDbService.cast(id)
    cast.map do |c|
      Cast.new(c)
    end
  end
end

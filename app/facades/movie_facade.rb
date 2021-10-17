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
end
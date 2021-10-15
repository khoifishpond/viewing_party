class MovieFacade
  def popular
    json = MovieDbService.top_movies_by_page(1) + MovieDbService.top_movies_by_page(2)
    json[:results].map do |result|
      Movie.new(result)
    end
  end
end
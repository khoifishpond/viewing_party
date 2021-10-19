class Movie
  attr_reader :title,
              :id,
              :vote_average,
              :genres,
              :runtime,
              :overview

  def initialize(results, reviews)
    @title = results[:title]
    @id = results[:id]
    @vote_average = results[:vote_average]
    @genres = results[:genres]
    @runtime = results[:runtime]
    @overview = results[:overview]
  end
end

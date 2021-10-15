class Movie
  attr_reader :title,
              :id,
              :vote_average,
              :genres,
              :runtime

  def initialize(results)
    @title = results[:title]
    @id = results[:id]
    @vote_average = results[:vote_average]
    @genres = results[:genres]
    @runtime = results[:runtime]
  end
end

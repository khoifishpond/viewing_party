class Review
  attr_reader :author,
              :content

  def initialize(reviews)
    @author = reviews[:author]
    @content = reviews[:content]
  end
end

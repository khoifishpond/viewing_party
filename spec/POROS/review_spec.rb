require 'rails_helper'

RSpec.describe Review do
  it 'stores review information as ruby objects' do
    VCR.use_cassette('review_poros') do
      reviews = MovieFacade.reviews(238)

      expect(reviews.first).to be_a Review
      expect(reviews).to be_an Array
      expect(reviews.first.content).to be_a String
      expect(reviews.first.author).to be_a String
    end
  end
end

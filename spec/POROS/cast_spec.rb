require 'rails_helper'

RSpec.describe Cast do
  it 'stores cast information as ruby objects' do
    VCR.use_cassette('cast_poros') do
      cast = MovieFacade.cast(238)

      expect(cast.first).to be_a Cast
      expect(cast).to be_an Array
      expect(cast.first.name).to be_a String
      expect(cast.first.character).to be_a String
    end
  end
end

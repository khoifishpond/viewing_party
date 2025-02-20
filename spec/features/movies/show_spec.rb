require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  it 'displays movie attributes' do
    VCR.use_cassette('movie_details') do
      visit movie_path(278)

      expect(page).to have_content("Shawshank Redemption")
      expect(page).to have_content("8.7")
      expect(page).to have_content("2 hour(s) 22 minute(s)")
      expect(page).to have_content("Drama")
      expect(page).to have_content("Crime")
    end
  end

  it 'displays movie summary' do
    VCR.use_cassette('movie_summary') do
      visit movie_path(278)

      expect(page).to have_content("Framed in the 1940s for the double murder of his wife and her lover,")
    end
  end

  it 'displays first 10 cast members' do
    VCR.use_cassette('cast_members') do
      visit movie_path(278)

      expect(page).to have_content("Tim Robbins")
      expect(page).to have_content("Andy Dufresne")
      expect(page).to have_content("Larry Brandenburg")
      expect(page).to have_content("Skeet")
    end
  end

  it 'displays review authors' do
    VCR.use_cassette('movie_details') do
      visit movie_path(278)

      expect(page).to have_content("Total Number of Reviews: 7")
      expect(page).to have_content("elshaarawy")
      expect(page).to have_content("Make way for the best film ever made people. **Make way.**")
    end
  end
end

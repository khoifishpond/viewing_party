require 'rails_helper'

describe 'New Party Page' do
  before(:each) do
    @user = User.create!(username: '1', email: '1@mail.com', password: '1')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'creates a party' do
    VCR.use_cassette('new_viewing_party') do
      movie = MovieFacade.movie_by_id(238)
      visit movie_path(movie.id)

      click_on 'Create Viewing Party'

      fill_in :duration, with: 300
      fill_in :date, with: '10-20-2021'
      fill_in :start_time, with: '07:00 PM'
      
      click_on 'Create Viewing Party'

      expect(page).to have_content(movie.title)
    end
  end

  it 'can invite friends to a viewing party' do
    VCR.use_cassette('new_viewing_party') do
      movie = MovieFacade.movie_by_id(238)
      visit movie_path(movie.id)

      click_on 'Create Viewing Party'

      fill_in :duration, with: 200
      fill_in :date, with: '10-20-2021'
      fill_in :start_time, with: '7:00 PM'

      click_on 'Create Viewing Party'

      expect(page).to have_content(movie.title)
    end
  end
end

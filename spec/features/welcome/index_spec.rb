require 'rails_helper'

RSpec.describe 'index page' do
  before(:each) do
    visit root_path
  end
  
  it 'welcome message' do
    expect(page).to have_content('Welcome to Viewing Party!')
  end

  it 'description' do
    expect(page).to have_content('Watch movies and chill with your friends.')
  end

  it 'login button' do
    expect(page).to have_button('Log in')
  end

  it 'registration' do
    expect(page).to have_link('Register')
  end
end
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
    expect(page).to have_button('Log In')
  end

  it 'registration' do
    expect(page).to have_link('Register')
  end

  it 'can log in with valid credentials' do
    user = User.create!(username: "funbucket13", password: "test", email: 'mail@mail.com')
    
    fill_in :user_username, with: user.username
    fill_in :user_password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Welcome, #{user.username}")
  end
end
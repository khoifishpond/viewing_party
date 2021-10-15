require 'rails_helper'

describe 'dashboard page' do
  before(:each) do
    @user1 = User.create!(username: 'khoi', email: 'kn@mail.com', password: 'teamnosleep')
    @user2 = User.create!(username: 'samantha', email: 'sp@mail.com', password: 'birdistheword')
    @user3 = User.create!(username: 'its_jj', email: 'jj@mail.com', password: 'swimshady')

    @friendship = Friendship.create!(user_id: @user1.id, friend_id: @user2.id)

    @party = Party.create!(host_id: @user1.id, movie_title: 'Man IDK', movie_runtime: 90, start_time: '10/15/2021 9:00:00 PM', duration: 90)

    @invite = PartyGuest.create!(user_id: @user2.id, party_id: @party.id)

    visit root_path

    fill_in :user_username, with: @user1.username
    fill_in :user_password, with: @user1.password

    click_on 'Log In'
  end

  it 'welcomes the the user' do
    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Welcome, #{@user1.username}!")
  end

  xit 'has link to Discover Movies Page' do
    click_on 'Discover Movies'

    expect(current_path).to eq(discover_index_path)
  end

  it 'can search and add friends by email' do
    fill_in :search, with: @user3.email

    click_on 'Add Friend'
    save_and_open_page
    expect(page).to have_content(@user3.username)
  end
end

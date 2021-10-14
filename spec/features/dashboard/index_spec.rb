require 'rails_helper'

describe 'dashboard page' do
  before(:each) do
    # @user1 = User.create!(username: 'khoi', email: 'kn@mail.com', password: 'cacapoopoo')
    # @user2 = User.create!(username: 'samantha', email: 'sp@mail.com', password: 'birdbirdbird')
    # @friendship = Friendship.create!(user_id: @user1, friend_id: @user2)
    # @party = Party.create!(host_id: @user, movie_title: 'Man IDK', movie_runtime: 90, start_time: '10/15/2021 9:00:00 PM', duration: 90)
    # @invite = PartyGuest.create!(user_id: @user2, party_id: @party)

    visit rooth_path

    fill_in :user_username, with: @user.username
    fill_in :user_password, with: @user.password

    click_on 'Log In'
  end
  
  xit 'welcomes the the user' do
    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Welcome, #{@user.username}!")
  end
end
require 'rails_helper'

RSpec.describe 'Dashboard Index Page' do
  it 'displays the current user username welcome message' do
    visit new_user_path

    username = "funbucket13"
    password = "test"
    email = "thisisanemail@gmail.com"

    fill_in :user_username, with: username
    fill_in :user_password, with: password
    fill_in :user_email, with: email

    click_on "Register"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Hello, #{username}")
  end
end

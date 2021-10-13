require 'rails_helper'

RSpec.describe 'Registration Page' do
  it 'creates a new user' do
    visit root_path

    click_on "Register"

    expect(current_path).to eq(new_user_path)

    username = "funbucket13"
    password = "test"

    fill_in :user_username, with: username
    fill_in :user_password, with: password

    click_on "Register"
    save_and_open_page
    expect(page).to have_content("Welcome, #{username}!")
  end
end

require 'rails_helper'

feature "Users visits root..." do
  # SMOKE TESTS
  scenario "and sees log in when not signed in" do
    visit root_path
    expect(page).to have_css('h2', text: 'Log In')
  end

  scenario "and sees personal dashboard after logging in" do
    # Set Up
    user = create(:user, username: 'user_username')

    # Exercise
    sign_in user
    visit root_path

    # Verify
    expect(page).to have_css('h3', text: 'user_username Dashboard')
  end
end

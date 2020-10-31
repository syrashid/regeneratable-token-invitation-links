require 'rails_helper'

feature "Users visits root..." do
  # SMOKE TESTS
  scenario "and sees log in when not signed in" do
    visit root_path
    expect(page).to have_css('h2', text: 'Log In')
  end

  scenario "and sees personal dashboard after logging in" do
    # Set Up
    maya = User.create!(username: 'maya_nicolas', email: 'gracia@baumbach.com', password: 'password')

    # Exercise
    sign_in_as(maya)

    # Verify
    expect(page).to have_css('h3', text: 'maya_nicolas Dashboard')

    # Teardown
    User.destroy_all
  end
end

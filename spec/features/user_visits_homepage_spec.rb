require 'rails_helper'

feature "Users visits root..." do
  # SMOKE TESTS
  scenario "and sees log in when not signed in" do
    visit root_path
    expect(page).to have_css('h2', text: 'Log In')
  end

  scenario "and sees personal dashboard after logging in" do
    # Set Up
    User.create!(username: 'maya_nicolas', email: 'gracia@baumbach.com', password: 'password')

    # Exercise
    visit root_path

    fill_in "Email", with: "gracia@baumbach.com"
    fill_in "Password", with: "password"

    click_button("commit")

    # Verify
    expect(page).to have_css('h3', text: 'maya_nicolas Dashboard')

    # Teardown
    User.destroy_all
  end
end

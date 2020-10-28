require 'rails_helper'

feature "Users visits root..." do
  # SMOKE TESTS
  scenario "and sees log in when not signed in" do
    visit root_path
    expect(page).to have_css('h2', text: 'Log In')
  end

  scenario "and sees personal dashboard after logging in" do

  end
end

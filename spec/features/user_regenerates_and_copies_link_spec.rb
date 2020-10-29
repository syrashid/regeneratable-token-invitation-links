require 'rails_helper'

feature "Users regenerates and copies invite link..." do
  scenario "successfully" do
    # Set Up
    sam = User.create!(username: 'sam_gamgee', email: 'sam@hobbit.com', password: 'password')
    mordor = Group.create(name: "Mordor", topic: "There's some good in this world, Mr. Frodo, and it's worth fighting for.")
    Membership.create(user: sam, group: mordor)

    # Exercise
    ## Log In
    visit root_path
    fill_in "Email", with: "sam@hobbit.com"
    fill_in "Password", with: "password"
    click_button("commit")

    ## Regenerate
    click_on("Mordor")
    old_invite_link = find_field("cb-link-field").value
    click_on("Regenerate")
    # expect(find_field(".cb-link-field").value).to eq 'John'
    # Verify
    expect(old_invite_link).not_to eq(find_field("cb-link-field").value)

    # Teardown
    Membership.destroy_all
    Group.destroy_all
    User.destroy_all
  end
end

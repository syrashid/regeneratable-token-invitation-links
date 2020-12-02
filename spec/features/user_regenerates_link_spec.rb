require 'rails_helper'

feature "Users regenerates invite link" do
  scenario "successfully" do
    # Set Up
    sam = User.create!(username: 'sam_gamgee', email: 'sam@hobbit.com', password: 'password')
    mordor = Group.create(name: "Mordor", topic: "There's some good in this world, Mr. Frodo, and it's worth fighting for.")
    Membership.create(user: sam, group: mordor)

    # Exercise
    ## Log In

    sign_in_as(sam)

    ## Regenerate
    click_on("Mordor")
    old_invite_token = mordor.invite_token
    click_button("regenerate-btn")

    # Verify

    expect(old_invite_token).not_to eq(mordor.invite_token)

    # Teardown
    Membership.destroy_all
    Group.destroy_all
    User.destroy_all
  end
end

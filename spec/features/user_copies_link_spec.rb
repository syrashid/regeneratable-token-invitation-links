require 'rails_helper'

feature "Users copies invite link" do
  scenario "successfully" do
    sam = User.create!(username: 'sam_gamgee', email: 'sam@hobbit.com', password: 'password')
    mordor = Group.create(name: "Mordor", topic: "There's some good in this world, Mr. Frodo, and it's worth fighting for.")
    Membership.create(user: sam, group: mordor)

    sign_in_as(sam)
    click_on("Mordor")
    click_button("Copy Link")

    expect(old_invite_link).not_to eq(find_field("cb-link-field").value)

    Membership.destroy_all
    Group.destroy_all
    User.destroy_all
  end
end

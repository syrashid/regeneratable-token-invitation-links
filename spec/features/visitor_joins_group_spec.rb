require 'rails_helper'

feature "Visitor visits new membership page..." do
  scenario "and signs up before joining group as a new member" do
    user = build(:user, username: 'user_username')
    group = create(:group, name: 'group_name')

    visit new_group_membership_path(group)
    sign_up_as(user)

    expect(page).to have_css('h3', text: 'user_username Dashboard')
    expect(page).to have_css('h5', text: 'group_name')
  end
end

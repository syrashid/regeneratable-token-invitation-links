require 'rails_helper'

feature "Users visits new membership page..." do
  scenario "and joins group as a new member" do
    user = create(:user, username: 'user_username')
    group = create(:group, name: 'group_name')

    sign_in user
    visit new_group_membership_path(group)

    expect(page).to have_css('h3', text: 'user_username Dashboard')
    expect(page).to have_css('h5', text: 'group_name')
  end

  xscenario "and logs in before joining group as a new member" do
    group = create(:group, name: 'group_name')
  end
end

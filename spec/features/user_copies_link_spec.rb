require 'rails_helper'

feature "Users copies invite link..." do
  scenario "successfully", js: true do
    user = create(:user)
    group = create(:group)
    membership = create(:membership, user: user, group: group)
    sign_in user

    visit group_path(group)
    click_button('groupname-btn')
    click_button("Copy Link")

    expect(page).to have_content('Link copied to clipboard!')
  end
end

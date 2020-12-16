require 'rails_helper'

feature "Users regenerates invite link..." do
  scenario "successfully", js: true do
    user = create(:user)
    group = create(:group)
    membership = create(:membership, user: user, group: group)
    sign_in user

    visit group_path(group)
    click_button('groupname-btn')
    old_invite_token = find('#cb-link-field')['value']
    click_button("regenerate-btn")

    expect(old_invite_token).not_to eq(find('#cb-link-field')['value'])
  end
end

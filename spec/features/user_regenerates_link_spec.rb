require 'rails_helper'

feature "Users regenerates invite link..." do
  xscenario "successfully", js: true do
    user = create(:user)
    group = create(:group)
    membership = create(:membership, user: user, group: group)
    sign_in user

    visit group_path(group)

    old_invite_token = group.invite_token
    click_button("regenerate-btn")

    expect(old_invite_token).not_to eq(group.invite_token)
  end
end

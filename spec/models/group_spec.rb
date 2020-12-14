require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'association tests' do
    it { should have_many(:memberships) }
    it { should have_many(:users) }
  end

  describe 'invite token methods (has_secure_token)' do
    it 'a group has a unique token generated upon creation' do
      group = create(:group)

      expect(group.invite_token).not_to be_nil
    end

    it 'a group generates a new token upon invocation' do
      group = create(:group)

      old_token = group.invite_token
      group.regenerate_invite_token

      expect(group.invite_token).not_to eq(old_token)
    end
  end
end

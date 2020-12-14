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

  describe '#to_param method' do
    it 'a group will return invite_token instead of id when to_param is called' do
      group = create(:group)

      expect(group.to_param).to eq(group.invite_token)
      expect(group.to_param).not_to eq(group.id.to_s)
    end
  end

  describe '#member? method' do
    it 'a group when passed an outside member should return false' do
      out_of_group_user = create(:user)
      membership = create(:membership)
      group = membership.group

      expect(group.member?(out_of_group_user)).to be false
    end

    it 'a group when passed a group member should return true' do
      user = create(:user)
      membership = create(:membership, user: user)
      group = membership.group

      expect(group.member?(user)).to be true
    end
  end
end

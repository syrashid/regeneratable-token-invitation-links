require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'a user is valid with a username present' do
      valid_user = build(:user)
      expect(valid_user).to be_valid
    end
    it 'a user is invalid with a username missing' do
      invalid_user = build(:user, username: nil)
      expect(invalid_user).to_not be_valid
    end
    it 'ensures a username is unique' do
      valid_user = create(:user, username: 'sample_name')
      invalid_user = build(:user, username: 'sample_name')
      expect(invalid_user).to_not be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe 'association tests' do
    it { should belong_to(:user) }
    it { should belong_to(:group) }
  end
end

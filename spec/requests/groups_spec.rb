require 'rails_helper'

RSpec.describe "Groups", type: :request do
  describe 'GET groups#index' do
    it 'should redirect when not signed in' do
      get root_path

      expect(response).to have_http_status(302)
    end

    it 'should show a users groups when signed in' do
      user = create(:user, username: 'unique_username')
      sign_in user

      get root_path

      expect(response).to be_successful
      expect(response.body).to include('unique_username Dashboard')
    end

  end

  describe 'GET groups#show' do
    it 'should show a single group when signed in' do
      group = create(:group)
      user = create(:user, username: 'unique_username')
      sign_in user

      get group_path(group)

      expect(response).to be_successful
      expect(response.body).to include('unique_username Group Show')
    end

    xit 'should show a single group when signed in and a member of a group' do

    end

    xit 'should redirect to groups index when signed in and not a member of a group' do

    end

    it 'should redirect when not signed in' do
      group = create(:group)

      get group_path(group)

      expect(response).to have_http_status(302)
    end
  end
end

require 'rails_helper'

RSpec.describe "InviteLinks", type: :request do
  describe "GET invite_links#show" do
    it "returns a json with a regenerated link" do
      headers = { accept: "application/json; charset=utf-8" }
      group = create(:group)
      user = create(:user)
      sign_in user

      get group_invite_link_path(group), headers: headers

      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response.body).to include('link')
    end
  end
end

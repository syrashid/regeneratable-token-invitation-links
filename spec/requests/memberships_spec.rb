require 'rails_helper'

RSpec.describe "Memberships", type: :request do
  describe "GET meberships#new" do
    context "A user signed in" do
      it "should create a membership if none exists" do

      end
    end
    context "A user not signed in" do
      it "should redirect to a sign up form with embedded invite token" do

      end
    end
  end

  describe "POST memberships#create" do
    it "should create a membership if none exists" do

    end
  end
end

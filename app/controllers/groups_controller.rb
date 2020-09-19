class GroupsController < ApplicationController
  def index
    @groups = Group.joins(memberships: :user).where(memberships: { user: current_user })
  end
end

class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find_by_invite_token(params[:invite_token])
  end
end

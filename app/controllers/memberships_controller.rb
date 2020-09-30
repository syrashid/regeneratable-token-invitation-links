class MembershipsController < ApplicationController
  skip_before_action :new
  def new
    if user_signed_in?
      create
    else
      raise
      redirect_to new_user_registration(invite_token: params[:group_id])
    end
  end

  def create
    group = Group.find_by_invite_token(params[:group_id])
    Membership.where(group: group, user: current_user).first_or_create
    redirect_to root_path
  end
end

# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def new
    @group = Group.find_by_invite_token(params[:invite_token]) if params[:invite_token]
    super
  end

  def create
    group = Group.find_by_invite_token(params[:user][:invite_token])
    Membership.where(group: group, user: current_user).first_or_create if group
    super
  end
end

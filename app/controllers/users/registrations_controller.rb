# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @group = Group.find_by_invite_token(params[:invite_token]) if params[:invite_token]
    super
  end

  def create
    super
    if resource.save && params[:user].key?(:invite_token)
      group = Group.find_by_invite_token(params[:user][:invite_token])
      Membership.create(group: group, user: resource)
    end
  end
end

class InviteLinksController < ApplicationController
  def show
    @group = Group.find_by_invite_token(params[:group_invite_token])
    @group.regenerate_invite_token
    @invite_link = new_group_membership_url(@group)
    respond_to do |format|
      format.html
      format.json { render json: { link: @invite_link, invite_token: @group.invite_token } }
    end
  end
end

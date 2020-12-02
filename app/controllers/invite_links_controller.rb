class InviteLinksController < ApplicationController
  def show
    @group = Group.find(params[:group_slug])
    @group.regenerate_invite_token
    @invite_link = new_group_membership_url(@group)
    respond_to do |format|
      format.html
      format.json { render json: { link: @invite_link } }
    end
  end
end

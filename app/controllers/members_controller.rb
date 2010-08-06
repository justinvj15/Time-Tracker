class MembersController < ApplicationController
   before_filter :login_required
  def index
      if @current_user.roles=='1'
  redirect_to dashboards_path
      end
     @users=User.find(:all)
  end

  def invite_member
  end

  def invited
  UserMailer.deliver_invite(params[:member][:email],current_user)
    flash[:notice]="Invitation email send"
  redirect_to members_path
  end
end

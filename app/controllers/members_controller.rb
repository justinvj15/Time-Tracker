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
  @invitation=current_user.invitations.new(params[:member])
  if @invitation.save
    flash[:notice]="Member invitations saved"
  else
    flash[:notice]="member invitations not saved"
  end
  puts @invitation.id
  UserMailer.deliver_invite(@invitation)
    flash[:notice]="Invitation email send"
  redirect_to members_path
  end
end

class MembersController < ApplicationController
   before_filter :login_required
   before_filter :admin_required,:except => [:assigned_tasks]
  def index
     @users=User.find(:all,:conditions => ["AdminId = '#{current_user.id}'"])
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
  def assigned_tasks
    #@tasks=Member.find(:all,:conditions=>["user_id= ?", current_user.id])
    @tasks=Task.find(:all,:conditions=>["user_id= ?" && Task::Project::user_id !='#{current_user.id}','#{current_user.id}'])
    end

  def destroy
    @member=User.find(params[:id])
    if @member.destroy
      flash[:notice]="Member Deleted"
      redirect_to members_path
    else
      flash[:notice]="Member not deleted"
      render:action=>index
    end
  end
end

class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem


  # render new.rhtml
  def new
    @user = User.new
    unless params[:val].blank?
      @invitation =Invitation.find(params[:val])
      @val = params[:val]
    end
   end
 
  def create
    logout_keeping_session!
    puts params[:user][:email_value]
    @user = User.new(params[:user])
    if !params[:user][:email_value].blank?
      @invitation =Invitation.find(params[:user][:email_value])
       @user.roles = '1'
       @user.AdminId = @invitation.user_id
       #@user.AdminId = params[:AdminId]
      else
        @user.roles = '0'
       end
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
        if @user.roles=='0'
       redirect_to projects_path
        else
          redirect_to dashboards_path
        end
      flash[:notice] = "Thanks for signing up!."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  end

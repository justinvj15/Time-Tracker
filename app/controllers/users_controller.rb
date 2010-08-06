class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem


  # render new.rhtml
  def new
    @user = User.new
    puts params[:val]
   end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      #self.current_user = @user # !! now logged in
       
      if !params[:val].blank?
       @user.update_attribute(:roles,'1')
      else
        @user.update_attribute(:roles,'0')
       end
       redirect_to login_path
      flash[:notice] = "Thanks for signing up!."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  end

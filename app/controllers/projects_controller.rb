class ProjectsController < ApplicationController
#  before_filter :login_required, :except => [:index, :show]
before_filter :login_required
  def index
   @projects=@current_user.projects
  end
  def edit
     @project=Project.find(params[:id])
  end
  def new
    @project=current_user.projects.new
  end
  def create
      @project=current_user.projects.new(params[:project])
       if @project.save
  flash[:notice]="project saved"
  redirect_to projects_path
else
  flash[:error]="project not saved"
  render :action =>'new'
  end
  end
  def show
    if @current_user.roles=='1'
  redirect_to dashboards_path
end
    @project=Project.find(params[:id])
    @tasks=@project.tasks
    #@users=@task.users
       end
   def update
    @project=Project.find(params[:id])
  if @project.update_attributes(params[:project])
    flash[:notice]="Project updated"
    redirect_to projects_path
  else
    flash[:error]="Project not updated"
    render :action=>'edit'
  end
  end
  def destroy
     @project=Project.find(params[:id])
  if @project.destroy
    flash[:notice]="Project deleted"
    redirect_to projects_path
  else
    flash[:error]="Project not deleted"
    render :action=>'index'
  end
  end
end

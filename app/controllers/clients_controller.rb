class ClientsController < ApplicationController
   before_filter :login_required
   before_filter :admin_required
    
  def index
    @clients=@current_user.clients
  end

  def new
  @client= current_user.clients.new
  end

  def create
     @client= current_user.clients.new(params[:client])#Client.new(params[:client])
#      @client.user_id=current_user.id
    if @client.save
  flash[:notice]="client created"
  redirect_to clients_path
    else
  flash[:error]="client not created"
  render :action =>'new'
    end
  end

  def destroy
     @client=Client.find(params[:id])
    if @client.destroy
    flash[:notice]="Client deleted"
    redirect_to clients_path
    else
    flash[:error]="Client not deleted"
    render :action=>'index'
    end
  end

  def update
    @client = Client.find(params[:element_id])
    if (params[:original_value]==@client.name)
      if @client.update_attribute(:name, params[:update_value])        
    flash[:notice]="client updated"
   render :text =>""
      else
    flash[:error]="client not updated"
    render :action=>'edit'
      end
    else
      if @client.update_attribute(:description, params[:update_value])
    flash[:notice]="client updated"
   render :text => ""
      else
    flash[:error]="client not updated"
    render :action=>'edit'
      end
     end
  end
end


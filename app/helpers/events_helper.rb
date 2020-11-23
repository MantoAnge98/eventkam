class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only:[:show, :update, :destroy]

  def index
    @events = Event.all

    if params[:name]
      @users = User.where(["name LIKE ?", "%#{params[:name]}%"]).page params[:page] if params[:name]
    else
      @users = User.all.order(name: :ASC).page params[:page]
    end  
 
    @user = current_user
    @participate = @user.participate
    @events_created = @user.events
    @past_events_user = @user.participate.past_events
    @future_events_user = @user.participate.future_events
  end


  def search 
    @users = User.all
    if params[:search].blank?  
      redirect_to users_path, notice: "Empty field!"
    else  
      @parameter = params[:search].downcase  
      @events = User.all.where("lower(name) LIKE :search", search: @parameter)  
    end  
  end


  def show
  
    @events = Participant.find_by(event_id: params[:format], participants_id: current_user[:id])
    #@favorite = @startup.favorites.find_by(startup_id: @startup.id)
    @user = User.find(params[:id])
  end

  def update
    redirect_to user_path(@user.id)
  end
  
  def destroy
    @user.destroy
    redirect_to root_path, notice: "User are Deleted :(( bye bye"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end

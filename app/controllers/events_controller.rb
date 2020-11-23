class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :login_check, only: %i[index new create edit show destroy]
  before_action :user_check, only: %i[edit destroy]

  def index
    @user = User.all
    if params[:title]
      @events = Event.where(["title LIKE ?", "%#{params[:title]}%"]).page params[:page] if params[:title]
    else
      @events = Event.all.order(created_at: :DESC).page params[:page]
    end  
  end

  def show
    @parts = @event.parts
    if current_user
      user_id = current_user.id
      @user_registered = @parts.where(id: user_id).exists?
    else
      @user_registered = 'Not registered'
    end
    
  end

  def search 
    @users = User.all
    if params[:search].blank?  
      redirect_to events_path, notice: I18n.t('event.search')
    else  
      @parameter = params[:search].downcase  
      @events = Event.all.where("lower(title) LIKE :search", search: @parameter)  
    end  
  end


  def new
    @user = User.all
    @event = current_user.events.build
  end

  def edit
    @event = Event.find(params[:id])
  end


  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path, notice: I18n.t('event.create')
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: I18n.t('event.update')
    else
      render :edit 
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: I18n.t('event.destroy')
  end


  private
    def user_check
      redirect_to events_path, notice: I18n.t('event.user_check') unless current_user.id == @event.user.id || current_user.try(:admin?)
    end

    def login_check
      unless user_signed_in?
        redirect_to root_path, notice: I18n.t('event.login_check')
      end 
    end

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :image, :image_cahe, :content, :date_start, :date_end, :organizer_id)
  end
end

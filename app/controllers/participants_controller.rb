class ParticipantsController < ApplicationController
  before_action :set_participant, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  

  # def index
  #   @events = Event.all
  #   @participants = Participant.all
  # end

  def show; end

  # def new
  #   @participant = Participant.new
  # end

  def edit; end

  def join_event
    @user = User.all
    event = Participant.create(event_id: params[:format], participants_id: current_user[:id])
    event.save
    flash[:notice] = 'Thank you for joining our event!'
    redirect_to event_path(params[:format])
  end


  def canceled_event
    event = Participant.find_by(event_id: params[:format], participants_id: current_user[:id])
    event.destroy
    flash[:notice] =  "The event is removed from your participation"
    redirect_to events_path
  end


  # def create
  #   @participant = Participant.new(participant_params)
  #     if @participant.save
  #       redirect_to @participant, notice: 'Participant was successfully created.' 
  #       render :show, status: :created, location: @participant 
  #     else
  #       render :new 
  #     end
  # end

  # def update
  #   respond_to do |format|
  #     if @participant.update(participant_params)
  #       redirect_to @participant, notice: 'Participant was successfully updated.' 
  #     else
  #       render :edit 
  #     end
  #   end
  # end

  # def destroy
  #   @participant.destroy
  #   respond_to do |format|
  #     redirect_to participants_url, notice: 'Participant was successfully destroyed.'
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_participant
    @participant = Participant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def participant_params
    params.require(:participant).permit(:event_id, :user_id)
  end
end

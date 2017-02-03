class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
    @gmapsurl="https://maps.googleapis.com/maps/api/js?key=#{ENV["GMAPS_API_KEY"]}&callback=initMap"
  end

  def show
    @event = Event.find(params[:id])
    @user = current_user
    @reviews = @event.reviews
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:alert] = "Event created successfully!"
      redirect_to @event
    else
      @events = Event.all
      flash.now[:notice] = @event.errors.full_messages.to_sentence
      render :index
    end
  end

  def edit
    @event = Event.find(params[:id])
    @user = current_user
    if @user.id == @event.user_id || @user.admin?
      render :edit
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
    redirect_to event_path
    else
      flash[:notice] = @event.errors.full_messages.to_sentence
        render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @user = current_user

    if @user.id == @event.user_id || @user.admin?
      Event.destroy(params[:id])
      redirect_to events_path
    else
      flash[:notice] = "You don't have permission to delete this event!"
      redirect_to @event
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :address, :city, :state, :zip_code, :description, :image)
  end
end

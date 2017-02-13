class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new

    coordinates = @events.map do |event|
      { lat: event.latitude, lng: event.longitude, name: event.name }
    end

    @coordinates = JSON.unparse(coordinates)
  end

  def show
    @event = Event.find(params[:id])
    @review = Review.new
    @user = current_user
    @reviews = @event.reviews

    @coordinates = JSON.unparse({ lat: @event.latitude, lng: @event.longitude, name: @event.name })
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

      coordinates = @events.map do |event|
        { lat: event.latitude, lng: event.longitude, name: event.name }
      end

      @coordinates = JSON.unparse(coordinates)

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
      flash[:notice] = "Historical place successfully deleted."
    else
      flash[:notice] = "You don't have permission to delete this place!"
      redirect_to @event
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :address, :description, :image)
  end
end

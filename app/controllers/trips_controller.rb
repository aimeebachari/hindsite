class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @trip = Trip.new
    @events = Event.all
  end

  def new
    @trip = Trip.new
    @trips = Trip.all
    @events = Event.all
  end

  def create
    @trip = Trip.new(trip_params)
    @events = Event.all

    if @trip.save
      flash[:notice] = "Trip created successfuly!"
      redirect_to @trip
    else
      @trips = Trip.all
      flash.now[:notice] = @trip.errors.full_messages.to_sentence
      render :index
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @user = current_user

    @origin = JSON.unparse({lat: @trip.start_event.latitude, lng: @trip.start_event.longitude})
    @destination = JSON.unparse({lat: @trip.end_event.latitude, lng: @trip.end_event.longitude})
  end

  def edit
    @trip = Trip.find(params[:id])
    @user = current_user
    if @user.id == @trip.user_id || @user.admin?
      render :edit
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to trip_path
    else
      flash.now[:notice] = @trip.errors.full_messages.to_sentence
        render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @user = current_user
    if @user.admin?
      Trip.destroy(params[:id])
      redirect_to trips_path
    else
      flash[:notice] = "You do not have permission to delete this trip."
      redirect_to @trip
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_event_id, :end_event_id)
  end
end

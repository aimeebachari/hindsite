class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    @events = Event.all
  end

  def create
    @trip = Trip.new(trip_params)
    @events = Event.all
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_event, :end_event)
  end
end

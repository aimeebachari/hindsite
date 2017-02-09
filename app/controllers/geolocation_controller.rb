class GeolocationController < ApplicationController

  def index
    @events = Event.all
    @event = Event.new

    coordinates = @events.map do |event|
      { lat: event.latitude, lng: event.longitude, name: event.name }
    end

    @coordinates = JSON.unparse(coordinates)
  end
  
end

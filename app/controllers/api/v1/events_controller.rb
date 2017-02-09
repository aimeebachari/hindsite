class Api::V1::EventsController  < ApplicationController

  def show
    @event = Event.find(params[:id])
    @reviews = @event.reviews
    render json: { reviews: @reviews }
  end
end

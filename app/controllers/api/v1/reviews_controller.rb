class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    data = request.body.read
    info_hash = JSON.parse(data)
    @body = info_hash["body"]
    @event_id = info_hash["event_id"]

    review = Review.new(body: @body, event_id: @event_id, user: current_user)

    if review.save
      render json: Review.all
    end
  end

end

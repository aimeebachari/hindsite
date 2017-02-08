class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    data = request.body.read
    info_hash = JSON.parse(data)
    @body = info_hash["body"]
    @event_id = info_hash["event_id"]

    review = Review.create!(body: @body, event_id: @event_id)
    reviews = Review.all

    if review.save
      render json: { review: reviews }
    end
  end

end

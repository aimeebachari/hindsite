class Api::V1::ReviewsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    review = Review.create(review_params)

    if review.save
      render json: {review: review}
    end
  end

  private

  def review_params
    params.permit(:body).merge(user: current_user).merge(event_id: params["event_id"])
  end
end

class Api::V1::CommentsController < ApplicationController
  def index
    @review = Review.find(params[:id])
    @comments = @review.comments
  end
end

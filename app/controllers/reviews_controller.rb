class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def edit
    @review = Review.find(params[:id])
    @event = @review.event
    @user = current_user
  end

  def update
    @review = Review.find(params[:id])
    @event = @review.event

    if current_user.id == @review.user_id || current_user.admin?
      render :edit
    else
      flash[:alert] = "You do not have permission to edit this review!"
      redirect_to @event
    end

    if @review.update(review_params)
      flash[:alert] = "Review updated successfully!"
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:event_id])
    @event = @review.event
    @user = current_user

    if @user.id == @review.user_id || @user.admin?
      @review.destroy
      redirect_to @event
    else
      flash[:notice] = "You don't have permission to delete this review!"
      redirect_to @event
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end

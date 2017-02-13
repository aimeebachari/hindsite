class ReviewsController < ApplicationController

  def edit
    @review = Review.find(params[:id])
    @event = @review.event
    @user = current_user
  end

  def update
    @review = Review.find(params[:id])
    @event = @review.event

    if @review.update(review_params)
      flash[:alert] = "Review updated successfully!"
      redirect_to @event
    else
      flash.now[:notice] = @review.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:event_id])
    @event = @review.event
    @user = current_user

    if @user.id == @review.user_id || @user.admin?
      @review.destroy
      flash[:notice] = "Review successfully deleted."
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

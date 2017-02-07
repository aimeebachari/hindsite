class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @event = Event.find(params[:event_id])
    @review = Review.new
  end

  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @review = Review.new(review_params)
    @review.event = @event
    @review.user = @user
    if @review.save
      flash[:alert] = "Review created successfully!"
      redirect_to @event
    else
      flash.now[:notice] = @review.errors.full_messages.to_sentence
    end
  end

  def edit
    @review = Review.find(params[:event_id])
    @event = @review.event
    @user = current_user

    if @user.id == @review.user_id || @user.admin?
      render :edit
    else
      flash[:alert] = "You do not have permission to edit this review!"
      redirect_to @event
    end
  end

  def update
    @review = Review.find(params[:id])
    @event = @review.event
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

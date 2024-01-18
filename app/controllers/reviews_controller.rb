class ReviewsController < ApplicationController

  def create
    # makes an instance variable where the argument passed is through the strong params
    @review = Review.new(review_params)
    # Identifies the current shown list from the URL
    @list = List.find(params[:list_id])
    # Assigns the list within the review as teh current one shown from the URL
    @review.list = @list
    # If the new save exists and isn't blank
    if @review.save
      # Redirect the user to the updated List show view
      redirect_to list_path(@list)
    else
      # I'm not sure why this is here
      @bookmark = Bookmark.new
      # Display that the content can't be blank within the "lists/show" path
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end

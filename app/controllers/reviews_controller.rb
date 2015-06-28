class ReviewsController < ApplicationController
  def create
    @reviewable = find_reviewable
    @review = @reviewable.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      @review.create_activity :create, owner: current_user
      respond_to do |format|
        format.html
        format.js
      end
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  private
  def find_reviewable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end


  def review_params
    params.require(:review).permit(:content, :user_id, :review_type)
  end
end
require 'active_support/concern'

module Reviewable
  extend ActiveSupport::Concern



  included do
    before_filter :reviews, :only => [:show]
  end

  def reviews
    @reviewable = find_reviewable
    @reviews = @reviewable.reviews.review_type(params[:review_type]).order('created_at')
    @review = Review.new
  end

  private

  def find_reviewable
    params[:controller].singularize.classify.constantize.find(params[:id])
  end

end
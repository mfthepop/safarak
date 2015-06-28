class RatingsController < ApplicationController

  def update
    @rating = Rating.find(params[:id])
    @location = @rating.ratable_id
    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end

end

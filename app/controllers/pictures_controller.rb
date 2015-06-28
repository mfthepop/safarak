class PicturesController < ApplicationController
  # before_action :set_picture, only: [:show, :edit, :update, :destroy]

  require 'jalali_date.rb'
  def create

    params[:picture][:date_taken] = JalaliDate.to_gregorian params[:picture][:date_taken]
    @picture = Picture.new(picture_params)
    if params[:tour_id]
      @picture.tour_id = params[:tour_id]
    end
    @picture.location_id = params[:location_id]
    if @picture.save
      flash[:notice] = "عکس بارگذاری شد"
      if params[:tour_id]
        redirect_to Tour.find params[:tour_id]
      else
        Location.find params[:location_id]
      end
    else
      flash[:error] = "Error adding review."
      redirect_to 'http://127.0.0.1/'
    end
  end


private

# Never trust parameters from the scary internet, only allow the white list through.
  def picture_params
    params.require(:picture).permit(:caption, :date_taken, :avatar)
  end

end

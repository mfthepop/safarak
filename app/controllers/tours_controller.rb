class ToursController < ApplicationController
	before_action :set_tour, only: [:show, :edit, :update, :destroy]
	helper_method :sort_column, :sort_direction

	# GET /tours
	# GET /tours.json

	#def index
	#  @tours = Tour.all
	#end

	load 'lib/commentable.rb'
	include Commentable
  load 'lib/reviewable.rb'
  include Reviewable

  require 'jalali_date.rb'

	def search
		@tours = Tour.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
	end

	def index
		@tours = Tour.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])


		respond_to do |format|
			format.js
			format.html
		end

	end

	#def index
	# @tours = Tour.order(params[:sort])
	#end


	# GET /tours/1
	# GET /tours/1.json
	def show
    @picture = Picture.new #TODO move to module
    @ratable = @tour
		if current_user
			@rating = Rating.where(ratable_id: @tour.id, user_id: current_user.id).first
			unless @rating
				@rating = @tour.ratings.create(ratable_id: @tour.id, user_id: current_user.id, score: 0)
			end
    end


	end

	# GET /tours/new
	def new
		@tour = Tour.new


	end

	# GET /tours/1/edit
	def edit
	end

	# POST /tours
	# POST /tours.json
	def create
		#@tour = Tour.new(tour_params)
		#@tour = @parent.tours.new(tour_params)

		params[:tour][:departure_date] = JalaliDate.to_gregorian params[:tour][:departure_date]

		@location = Location.find(params[:location_id])
		@tour = @location.tours.create(tour_params)


		respond_to do |format|
			if @tour.save
        @tour.create_activity :create, owner: current_user
				format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
				format.json { render action: 'show', status: :created, location: @tour }
			else
				format.html { render action: 'new' }
				format.json { render json: @tour.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /tours/1
	# PATCH/PUT /tours/1.json
	def update

		params[:tour][:departure_date] = JalaliDate.to_gregorian params[:tour][:departure_date]


		respond_to do |format|
			if @tour.update(tour_params)
        @tour.create_activity :update, owner: current_user
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @tour.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /tours/1
	# DELETE /tours/1.json
	def destroy
		@tour.destroy
    @tour.create_activity :destroy, owner: current_user
		respond_to do |format|
			format.html { redirect_to tours_url }
			format.json { head :no_content }
		end
  end

  # def filter
  #   params[:filter]
  #   redirect_to @tour
  # end


	# Use callbacks to share common setup or constraints between actions.
	private
	def sort_column
		Tour.column_names.include?(params[:sort]) ? params[:sort] : "quorum"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end


	def set_tour
		@tour = Tour.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def tour_params
		params.require(:tour).permit(:departure_date, :name, :departure_time, :departure_location, :quorum, :price)
	end


end

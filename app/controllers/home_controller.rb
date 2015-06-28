class HomeController < ApplicationController
      helper_method :sort_column, :sort_direction    
      def sort_column  
      Tour.column_names.include?(params[:sort]) ? params[:sort] : "quorum"  
    end   
    
	def sort_direction  
		%w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
	end
  def index
  end

  def about
  end
  
  def search
   @tours = Tour.search(params[:search])#.order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
	@locations = Location.search(params[:search])
	@profiles = Profile.search(params[:search])
  end

  def contact
  end
end

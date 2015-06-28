module ToursHelper
    def index  
      @tours = Tour.order(params[:sort] + ' ' + params[:direction])  
    end  
end

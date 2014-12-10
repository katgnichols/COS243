class RidesController < ApplicationController
    def index
	order_param = (params[:order] || :Date).to_sym
	ordering = case order_param
		   when :Date
		       :date
		   when :Service
		       :service_id
		   end
	@rides = Ride.order(ordering)
    end
  
  def new
    @ride = Ride.new
  end
    
  def show
  end
  
end

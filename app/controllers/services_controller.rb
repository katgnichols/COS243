class ServicesController < ApplicationController
  def index
    @services = Service.all
  end
  
  def new
    @service = Service.new
  end
  
  def create
    @service =Service.new(service_params)
  
  end
  
  def show
  end
  
    private

  def user_params
    params.require(:service).permit(:start_time, :finish_time, :location )
  end
  
  
end

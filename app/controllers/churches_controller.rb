class ChurchesController < ApplicationController
  
  def index
    @churches = Church.all
  end
  
  def show
     @church = Church.find(params[:id])
  rescue
    flash[:danger] = "Unable to find church"
    redirect_to churches_path
  end
  
  def new
    @church = Church.new
    @church.services.build
  end

  def create
    @church = Church.new(church_params)
    @church.user = current_user
    if @church.save
      flash[:success] = "Church created"
      redirect_to @church
    else
      flash.now[:danger] = "Unable to create church"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @church = church.find(params[:id])
    
    if @church.update_attributes(church_params)
      flash[:success] = "Welcome to the site, #{@church.name}"
      redirect_to @church
    else
      flash.now[:danger] = "Unable to update church"
      render 'edit'
    end
  end

  def destroy
    @church = Church.find(params[:id])
    if @church.destroy
      flash[:success] = "Good-bye"
      redirect_to (churches_path)
    else
      flash.now[:danger] = "Unable to delete church"
      render 'churches_path'
    end
  end

  private

  def church_params
    params.require(:church).permit(:name,
      :web_site,
      :description,
      :picture,
      services_attributes: [ :day_of_week, 
        :start_time,
        :finish_time,
        :location ] )
  end
end

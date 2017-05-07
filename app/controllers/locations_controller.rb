class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    redirect_to location_path(@location)
  end

  def show
    @location = Location.find(params[:id])
    update
  end

  def update
    @location = Location.find(params[:id])
    sleep(1.0)
    @result = Net::HTTP.get(URI.parse("http://api.timezonedb.com/v2/get-time-zone?key=9V7A8K8QQ4IJ&format=json&by=position&lat=#{@location.latitude}&lng=#{@location.longitude}"))
    @location.update_attributes(:apiresponse => @result)
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end

end

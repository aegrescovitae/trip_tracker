class LocationsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @location = @trip.locations
  end

  def show
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @location = Location.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @trip.locations.create(location_params)
    redirect_to trip_locations_path(@trip)
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @location = Location.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @trip.locations.find(params[:id]).update(location_params)
    redirect_to trip_locations_path
  end

  def destroy
    @location = Location.find(params[:id])
    redirect_to trip_locations_path
  end

  private

  def location_params
    params.require(:location).permit(:name,:trip_id)
  end

end

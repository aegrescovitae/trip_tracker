class LocationsController < ApplicationController
  before_action :trip
  before_action :location, only: [:show, :edit, :update, :destroy]
  
  def index
    @locations = @trip.locations.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = @trip.locations.new(location_params)
    redirect_to trip_location_path(@trip, @location)
    if @location.save
      redirect_to trip_locations_path(@trip)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @location.update(location_params)
      redirect_to trip_location_path(@trip, @location)
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to trip_locations_path(@trip)
  end

  private

  def trip
    @trip = Trip.find(params[:trip_id])
  end

  def location_params
    params.require(:location).permit(:name)
  end

  def location
    @location = @trip.locations.find(params[:id])
  end

end

class TripsController < ApplicationController
  before_action :trip, except: [:index, :new, :create]

  def index
    @trip = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    redirect_to trips_path
  end

  def edit

  end

  def update
    @trip.update(trip_params)
    redirect_to trip_path
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :date)
  end

  end

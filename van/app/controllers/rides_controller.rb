class RidesController < ApplicationController
  def index
    rides = Ride.all
    render :json => rides.to_json
  end

  def create
    @ride = Ride.new(pickup_latitude:params[:latitude], pickup_longitude: params[:longitude])

    if @ride.save
      render :json => @ride.to_json
    else
      render json: {message: "Something went wrong"}, status: 500
    end
  end

  def show
    ride = Ride.find_by(id: params[:id])
    render :json => ride.to_json
  end

  def destroy
    ride = Ride.find_by(id: params[:id])

    if ride.destroy
      render json: {message: "Successfully deleted"}, status: 200
    else
      render json: {message: "Something went wrong"}, status: 500
    end
  end

  def update_with_complete
     @ride = Ride.find_by(id: params[:id])
     @ride.complete = true
     if @ride.save
       render :json => @ride.to_json
     else
       render json: {:errors => @ride.errors.full_messages }
     end
   end
end

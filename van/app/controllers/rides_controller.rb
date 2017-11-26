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

  def show_waiting_requests
    rides = Ride.where("status = ?", "Waiting")
    render :json => rides.to_json
  end

  def destroy
    ride = Ride.find_by(id: params[:id])

    if ride.destroy
      render json: {message: "Successfully deleted"}, status: 200
    else
      render json: {message: "Something went wrong"}, status: 500
    end
  end

  def start_ride

    send_text
  end

  def send_text
    account_sid = "AC4def0e4247e3a242ad66b44c485c400a"
    auth_token = "9b0d156bd4122f290f992a9603c652a6"
    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end

    @client = Twilio::REST::Client.new

    @client.messages.create({
      from: "+17187362402",
      to: "+13475998150",
      body: "You driver is en route"
    })
    return nil
  end

  def update_with_complete
     @ride = Ride.find_by(id: params[:id])
     @ride.status = "Complete"
     if @ride.save
       render :json => @ride.to_json
     else
       render json: {:errors => @ride.errors.full_messages }
     end
   end
end

class RidesController < ApplicationController
  def index
    rides = Ride.all
    render :json => rides.to_json
  end

  def create
    @ride = Ride.new(pickup_latitude:params[:pickup_latitude], pickup_longitude: params[:pickup_longitude], destination_latitude:params[:destination_latitude], destination_longitude:params[:destination_longitude])

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
    @ride = Ride.find_by(id: params[:id])
     @ride.status = "In Progress"
     if @ride.save
       send_start_text
       render :json => @ride.to_json
     else
       render json: {:errors => @ride.errors.full_messages }
     end

  end

  def send_start_text
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
      body: "Your Vantastic driver is roughly 7 minutes away in a blue Ford, license plate 4X32LUR"
    })
    return nil
  end

  def update_with_complete
     # @ride = Ride.find_by(id: params[:id])
     # @ride.status = "Complete"
     # if @ride.save
     #   render :json => @ride.to_json
     # else
     #   render json: {:errors => @ride.errors.full_messages }
     # end
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
      body: "Thank you for using Vantastic.  Please respond with a number 1 through 5 to rate your experience!"
    })
    return nil
   end

   def pick_up
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
      body: "Your Vantastic driver has arrived at the pickup location"
    })
    return nil
   end
end

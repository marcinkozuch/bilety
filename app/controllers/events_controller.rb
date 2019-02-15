class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit]
  before_action :check_logged_in, :only => [:new, :create]
  
  def index
    @events = Event.all
    @tickets = Ticket.all
  end

  def new
    @event = Event.new
    @ticket = Ticket.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:komunikat] = 'Event został poprawnie stworzony.'
      redirect_to "/events/#{@event.id}"
    else
      render 'new'
    end
  end

  def show
    @ticket = Ticket.new
  end

  
  def event_params
    params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
			
    end

<<<<<<< HEAD
    private
		def check_logged_in
					authenticate_or_request_with_http_basic("Ads") do |username, password|
								username == "admin" && password == "1234"
=======
		def check_logged_in
					authenticate_or_request_with_http_basic("Ads") do |username, password|
								username == "admin" && password == "admin"
>>>>>>> ea9e59b3c23db0537406462d78b636206744c964
					end
		end

end

class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit]
  before_action :check_logged_in, :only => [:new, :create]
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
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

		def check_logged_in
					authenticate_or_request_with_http_basic("Ads") do |username, password|
								username == "admin" && password == "admin"
					end
		end

end

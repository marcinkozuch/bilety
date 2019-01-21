class EventsController < ApplicationController
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
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)
  end

end

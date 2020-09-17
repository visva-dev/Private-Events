class EventsController < ApplicationController
  include EventsHelper
  def new
    @event = Event.new
  end

  def index
    @events = current_user.events
    @creator = current_user.username
  end

  def create
    @event = current_user.events.build(event_params)
    # @attendee = EventsUser.new(event_users_params)
    @event.creator_id = session[:user_id]
    if @event.save
      flash.notice = "Event '#{@event.title}' Created!"
      redirect_to event_path(@event)

    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendee = @event.attendees
  end

  # private

  # def event_users_params
  #   params.require(:events_users).permit(:attendee_id, :event_id)
  # end
end

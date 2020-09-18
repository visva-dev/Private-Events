# frozen_string_literal: true

class EventsController < ApplicationController
  include EventsHelper
  def new
    @event = Event.new
    @attendee = EventsRegistrator.new
  end

  def index
    @events = current_user.events
    @creator = current_user.username
    @future = Event.future
    @past = Event.past
  end

  def create
    @users = User.all
    @event = current_user.events.build(event_params.except(:attendees))

    @event.creator_id = session[:user_id]

    if @event.save
      flash.notice = "Event '#{@event.title}' Created!"
      event_params.slice(:attendees).values.each do |x|
        x.each do |y|
          if y.empty?
          else
            user = @users.find(y.to_i)
            @event.attendees << user
          end
        end
      end
      redirect_to event_path(@event)

    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendee = @event.attendees
  end

  private

  def event_users_params
    params.require(:events_registrator).permit(:attendee_id, :attended_event_id)
  end
end

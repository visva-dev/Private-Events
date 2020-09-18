module EventsHelper
  def event_params
    params.require(:event).permit(:title, :description, :time, attendees: [])
  end
end

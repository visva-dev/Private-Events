module EventsHelper
  def event_params
    params.require(:event).permit(:title, :description, :time)
  end
end

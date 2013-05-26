class Admin::EventsController < Admin::BaseController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create event_params
    respond_with @event, location: admin_events_path
  end

  def edit
    @event = Event.find event_id
  end

  def update
    @event = Event.update event_id, event_params
    respond_with @event, location: admin_events_path
  end

  def destroy
    Event.destroy event_id
    redirect_to admin_events_path
  end

  private

  def event_id
    params[:id]
  end

  def event_params
    params.require(:event).permit(
      :conference_id,
      :name,
      :date,
      :publicly_announced,
      :facebook_event_url,
      :venue_name,
      :venue_site_url,
      :venue_address,
      :venue_google_map_url,
      :venue_google_map_image_url,
      :venue_notes
    )
  end
end

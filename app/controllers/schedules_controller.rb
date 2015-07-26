class SchedulesController < ApplicationController
  def index
    event = current_conference.current_event
    redirect_to schedule_path(event.name, format: :json)
  end

  def show
    @track = params[:track].to_i
    @event = current_conference.announced_event_named(params[:id])
  end
end
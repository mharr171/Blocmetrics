class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    @event.application = Application.find(params[:application_id])

    if @event.save
      flash[:notice] = 'Event was saved.'
      redirect_to application_path(@application)
    else
      flash.now[:alert] = 'There was an error saving the event. Please try again.'
      redirect_to application_path(@application)
    end
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end

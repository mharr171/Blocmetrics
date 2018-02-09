class Api::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_access_control_headers

  def create
    application = Application.find_by(url: request.env['HTTP_ORIGIN'])
    @event = Event.new(event_params)
    @event.application = application

    if application
      if @event.save
        render json: @event, status: :created
      else
        render json: {errors: @event.errors}, status: :unprocessable_entity
      end
    else
      render json: "Unregistered application", status: :unprocessable_entity
    end
  end

  def preflight
    head 200
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end

class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show,:edit,:update,:destroy]

  def index
    @applications = Application.all.where(user: current_user)
  end

  def show
    @application = nil if @application.user != current_user
    @events = @application.events.group_by(&:name) if @application
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user

    if @application.save
      flash[:notice] = 'Application was saved.'
      redirect_to application_path(@application)
    else
      flash.now[:alert] = 'There was an error saving the Application. Please try again.'
      render :new
    end
  end

  def edit

  end

  def update
    @application.assign_attributes(application_params)

    if @application.save
      flash[:notice] = 'Application was updated.'
      redirect_to [@application]
    else
      flash.now[:alert] = 'There was an error saving the application. Please try again.'
      render :edit
    end
  end

  def destroy
    if @application.destroy
      flash[:notice] = "\"#{@application.name}\" was deleted successfully."
      redirect_to @application
    else
      flash.now[:alert] = 'There was an error deleting the application.'
      render :show
    end
  end

  private

  def application_params
    params.require(:application).permit(:name,:url)
  end

  def set_application
    @application = Application.find(params[:id])
  end
end

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    # Student.all.each do |student|
    #   send_sms_to_parent(student, Notification.new(message: @event.title))
    # end
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start, :end, :color)
  end
end

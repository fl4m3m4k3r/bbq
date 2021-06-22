class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :current_user_is_owner?, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
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
    @event.user = current_user

    if @event.save
      redirect_to @event, notice: I18n.t('controllers.events.created')
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: I18n.t('controllers.events.updated')
    else
      render :edit
    end
  end

  def destroy
    if @event.user == current_user
      user = @event.user
      @event.destroy
      redirect_to user_path(user), notice: I18n.t('controllers.events.destroyed')
    else
      redirect_to root_path, alert: 'Это нельзя'
    end
  end

  private

  def current_user_is_owner?
    if
      @event.user == current_user
    else
      redirect_to root_path, alert: 'Не пытайтесь, мы всё предусмотрели.'
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description)
  end
end

class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :authorize_user!, only: [:edit, :update, :destroy]
    def index
        @events = Event.all
      end
    def new
        @event = Event.new
      end
      def create
        @event = Event.new(event_params)
        @event.user = @current_user
        if @event.save
          redirect_to events_path, notice: "Event Created"
        else
          render :new
        end
      end
      def show
        @tag = @event.tag_for(current_user)

      end
      def edit
        redirect_to root_path, alert: "access defined" unless can? :edit, @event
      end
      def update
        redirect_to root_path, alert: "access defined" unless can? :update, @event
        if @event.update event_params
          redirect_to @event, notice: "Event Updated"
        else
          render :edit
        end
      end
    def destroy
        redirect_to root_path, alert: "access defined" unless can? :destroy, @event
        @event.destroy
        redirect_to events_path, notice: "Event Deleted"
    end
    private
    def find_event
        @event = Event.find params[:id]
    end
      def authorize_user!
    unless can? :crud, @event
      flash[:danger] = "Access Denied"
      redirect_to root_path
    end
  end
    def event_params
        params.require(:event).permit(:title, :description ,:location, :price, :image_url,:participants,:start_time)
    end
end
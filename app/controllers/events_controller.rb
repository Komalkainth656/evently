class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @events = Event.all
      end
    def new
        @event = Event.new
      end
      def create
        @event = Event.new(event_params)
        if @event.save
          redirect_to events_path, notice: "Event Created"
        else
          render :new
        end
      end
      def show
      end
      def edit
      end
      def update
        if @event.update event_params
          redirect_to @event, notice: "Event Updated"
        else
          render :edit
        end
      end
    def destroy
        @event.destroy
        redirect_to events_path, notice: "Event Deleted"
    end
    private
    def find_event
        @event = Event.find params[:id]
    end
    def event_params
        params.require(:event).permit(:title, :description ,:location, :price, :image_url,:participants,:start_time)
    end
end
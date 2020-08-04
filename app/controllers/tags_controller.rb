class TagsController < ApplicationController
    before_action :authenticate_user!
  def create
     tag = current_user.tags.new
      event = Event.find params[:event_id]
     tag.event = event
      if tag.save
        redirect_to event, notice: "Taged!"
      else
        redirect_to event, alert: "Can't Tag!"
      end
    end
   
    def destroy
     tag = current_user.tags.find params[:id]
     tag.destroy
     event= Event.find params[:event_id]
      redirect_to event, notice: "U tagd"
    end
end

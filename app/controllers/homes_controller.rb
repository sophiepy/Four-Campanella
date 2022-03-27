class HomesController < ApplicationController
  def top
    @items = Item.all
  end
  def about
  end
  # def info
  #   # @event = Event.all
  #   @event = Event.find(params[:format])
  # end


  def event_parameter
    params.require(:event).permit(:id, :content, :plan, :start_time)
  end

end


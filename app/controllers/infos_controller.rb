class InfosController < ApplicationController
  def show
    # @event = Event.all
    @event = Event.find(params[:id])
    # @user = User.find(params[:id])

  end
end


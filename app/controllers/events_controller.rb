class EventsController < ApplicationController
  def index
    @events = Event.all
    # 3/26管理者権限のあるユーザーがどうかを下記で見ます
    # @user = User.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:event_id])
  end

  def create
    Event.create(event_params)
    redirect_to events_path
  end
  # 編集や削除については管理人だけができるようにしたい。
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice:"削除しました"
  end

  def edit
    @event = Event.find(params[:id])
    # @event = Event.find(params[:event_id])
  end

  def update
    @event = Event.find(params[:id])
    #"2022-5-5"
    date = event_params["start_time(1i)"] + "-" +  event_params["start_time(2i)"] + "-" +  event_params["start_time(3i)"]
    #"14:00"
    time =  event_params["start_time(4i)"] + ":" +  event_params["start_time(5i)"]
    #"2022-5-5 14:00"
    start_time = date + time

    if @event.update(
      content: event_params[:content],
      plan: event_params[:plan],
      start_time: start_time
    )
      redirect_to events_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_id, :content, :plan, :start_time, "start_time(1i)", "start_time(2i)", "start_time(3i)", "start_time(4i)", "start_time(5i)")
  end

end

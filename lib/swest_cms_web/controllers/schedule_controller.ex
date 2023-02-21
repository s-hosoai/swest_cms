defmodule SwestCmsWeb.ScheduleController do
  use SwestCmsWeb, :controller

  def index(conn, _params) do
    render(conn, "schedule.html")
  end
end

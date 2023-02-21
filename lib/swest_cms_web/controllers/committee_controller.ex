defmodule SwestCmsWeb.CommitteeController do
  use SwestCmsWeb, :controller

  def index(conn, _params) do
    render(conn, "committee.html")
  end
end

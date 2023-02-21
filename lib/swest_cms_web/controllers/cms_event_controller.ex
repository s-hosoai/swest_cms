defmodule SwestCmsWeb.CmsEventController do
  use SwestCmsWeb, :controller

  def index(conn, _params) do
    render(conn, "cms_event.html")
  end
end

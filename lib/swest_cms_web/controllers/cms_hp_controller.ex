defmodule SwestCmsWeb.CmsHpController do
  use SwestCmsWeb, :controller

  def index(conn, _params) do
    render(conn, "cms_hp.html")
  end
end

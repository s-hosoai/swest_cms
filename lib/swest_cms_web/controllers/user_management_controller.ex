defmodule SwestCmsWeb.UserManagementController do
  use SwestCmsWeb, :controller

  def index(conn, _params) do
    render(conn, "user_management.html")
  end
end

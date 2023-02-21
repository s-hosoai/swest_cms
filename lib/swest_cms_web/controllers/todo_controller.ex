defmodule SwestCmsWeb.TodoController do
  use SwestCmsWeb, :controller

  def index(conn, _params) do
    render(conn, "todo.html")
  end
end

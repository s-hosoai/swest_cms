defmodule SwestCmsWeb.TaskPage do
  use SwestCmsWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, [])}
  end

  def render(assigns) do
    ~H"""
    <h1>table</h1>
    <div class="flex flex-row w-full">
    </div>
    """
  end
end

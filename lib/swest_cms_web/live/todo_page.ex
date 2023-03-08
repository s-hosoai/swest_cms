defmodule SwestCmsWeb.TodoPage do
  alias SwestCmsWeb.Live.DataTable
  use SwestCmsWeb, :live_view
  import SwestCmsWeb.Live.DataTable

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _url, socket) do
    {
      :noreply,
      socket
      |> assign(:params, params)
      |> assign(:customers, list_customers(params))
      # |> apply_action(socket.assigns.live_action, params)
    }
  end

  defp list_customers(params) do
    %{
      name: "hoge",
      address: "hoo",
      zip: "zip",
      city: "city",
      phone: "phone",
      longitude: "long",
      latitude: "lati"
    }

    # DataTable.list_todo(params)
  end
end

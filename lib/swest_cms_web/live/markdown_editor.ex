defmodule SwestCmsWeb.MarkdownEditor do
  use SwestCmsWeb, :live_view

  def mount(_params, _session, socket) do
    rawhtml = Earmark.as_html!("# Hello World!\n !aae ee! [sample](code) \n - aaa \n - bbb")
    markdown = ""
    {:ok, assign(socket, rawhtml: rawhtml, markdown: markdown)}
  end

  def render(assigns) do
    ~H"""
    <h1>Markdown Previewer</h1>
    <%!-- <form phx-change="change" >
    <input type="text" name="text" value={@markdown} />
    </form> --%>
    <%= raw @rawhtml %>
    """
  end

  def handle_event("change", %{"markdown" => markdown}, socket) do
    {:noreply, assign(socket, markdown: markdown)}
  end
end

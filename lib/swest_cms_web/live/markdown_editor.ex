defmodule SwestCmsWeb.MarkdownEditor do
  use SwestCmsWeb, :live_view

  def mount(_params, _session, socket) do
    # rawhtml = Earmark.as_html!("# Hello World!\n !aae ee! [sample](code) \n - aaa \n - bbb")
    # markdown = ""
    {:ok, assign(socket, rawhtml: "", markdown: "")}
  end

  def render(assigns) do
    ~H"""
    <h1>Markdown Previewer</h1>
    <form phx-change="change">
    <textarea name="text" value="{@markdown}"/>
    <button text="save" value="save" >save </button>
    </form>
    <%= raw @rawhtml %>
    """
  end

  def handle_event("change", %{"_target" => ["text"], "text" => text}, socket) do
    rawhtml = Earmark.as_html!(text)
    {:noreply, assign(socket, rawhtml: rawhtml, markdown: text)}
  end
end

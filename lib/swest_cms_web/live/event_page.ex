defmodule SwestCmsWeb.EventPage do
  use SwestCmsWeb, :live_view

  @pages %{
    page1: "# 総合案内\n ",
    page2: "# プログラム \n ",
    page3: "# 会場マップ \n [map](https://swest.toppers.jp/images/SWEST_logo_PC-86a1720fed.svg)",
    page4: "# チャット\n "
  }

  def mount(_params, _session, socket) do
    rawhtml = Earmark.as_html!(@pages[:page1])
    {:ok, assign(socket, rawhtml: rawhtml, current_page: :page1)}
  end

  def render(assigns) do
    ~H"""
    <h1> 参加者用ページ</h1>
    <a phx-click="page1">総合案内</a> /
    <a phx-click="page2">プログラム</a> /
    <a phx-click="page3">会場マップ</a> /
    <a phx-click="page4">チャット</a> /
    <%= raw @rawhtml %>
    """
  end

  def handle_event("page1", _, socket), do: apply_page(:page1, socket)
  def handle_event("page2", _, socket), do: apply_page(:page2, socket)
  def handle_event("page3", _, socket), do: apply_page(:page3, socket)
  def handle_event("page4", _, socket), do: apply_page(:page4, socket)

  defp apply_page(page, socket) do
    rawhtml = Earmark.as_html!(@pages[page])
    socket = assign(socket, rawhtml: rawhtml, current_page: page)
    {:noreply, socket}
  end
end

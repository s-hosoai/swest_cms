defmodule SwestCmsWeb.MainPage do
  use SwestCmsWeb, :live_view

  @pages %{
    page1: "# SWEST(エスウエスト)とは\n swestとは・・・",
    page2: "# SWEST24開催案内 \n 2023/09/xx-xx",
    page3: "# プログラム \n プログラム1、2、3",
    page4: "# スポンサー\n スポンサー様"
  }

  def mount(_params, _session, socket) do
    rawhtml = Earmark.as_html!(@pages[:page1])
    {:ok, assign(socket, rawhtml: rawhtml, current_page: :page1)}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-3lx font-bold underline">
    Hello world!
    </h1>
    <button class="btn">button</button>
    <a phx-click="page1">swestとは</a> /
    <a phx-click="page2">開催案内</a> /
    <a phx-click="page3">プログラム</a> /
    <a phx-click="page4">スポンサー</a> /
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

defmodule SwestCmsWeb.AdminPage do
  use SwestCmsWeb, :live_view

  @pages %{
    page1: "# ページ一覧・編集 \n ",
    page2: "# プログラム管理 \n プログラム管理",
    page3: "# 参加者管理 \n 参加者管理",
    page4: "# ポスター管理 \n ポスター管理"
  }

  def mount(_params, _session, socket) do
    rawhtml = Earmark.as_html!(@pages[:page1])
    {:ok, assign(socket, rawhtml: rawhtml, current_page: :page1)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-row w-full">
      <div class="grid flex-grow ">
        <ul class="menu w-64 border bg-base-100 rounded-box">
          <li>
          <a phx-click="page1">タスク管理</a>
          </li>
          <li>
          <a phx-click="page2">Webページ管理</a>
          </li>
          <li>
          <a phx-click="page3">ユーザ管理</a>
          </li>
        </ul>
      </div>
      <div class="grid flex-grow "><%= raw @rawhtml %></div>
    </div>
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

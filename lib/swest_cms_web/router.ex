defmodule SwestCmsWeb.Router do
  use SwestCmsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SwestCmsWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SwestCmsWeb do
    pipe_through :browser

    live "/", MainPage
    live "/light", LightLive
    live "/markdown", MarkdownEditor
    live "/main", MainPage
    live "/admin", AdminPage
    live "/event", EventPage

    get "/cms_hp", CmsHpController, :index
    get "/cms_event", CmsEventController, :index
    get "/user", UserManagementController, :index
    get "/todo", TodoController, :index
    get "/schedule", ScheduleController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", SwestCmsWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SwestCmsWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end

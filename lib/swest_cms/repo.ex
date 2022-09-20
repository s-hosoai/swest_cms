defmodule SwestCms.Repo do
  use Ecto.Repo,
    otp_app: :swest_cms,
    adapter: Ecto.Adapters.SQLite3
end

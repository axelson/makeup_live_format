defmodule MakeupLive.Repo do
  use Ecto.Repo,
    otp_app: :makeup_live,
    adapter: Ecto.Adapters.Postgres
end

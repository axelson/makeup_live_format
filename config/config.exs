# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :makeup_live,
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :makeup_live, MakeupLiveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cWT5GRJqD2MEmsQfeK86J2HgmZxi6YA/Fx/Y8wjhRnnAVZO0uJz+aI+2Nsck71dF",
  render_errors: [view: MakeupLiveWeb.ErrorView, accepts: ~w(html json)],
  render_errors: [
    formats: [html: MakeupLiveWeb.ErrorHTML, json: MakeupLiveWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: MakeupLive.PubSub,
  live_view: [
    signing_salt: "NpREzhguz87xA0eEUC6IcMT2PLRDIuCw"
  ]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  makeup_live: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# config :logger, backends: [RingLogger]
# config :logger, backends: [ExSync.Logger]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

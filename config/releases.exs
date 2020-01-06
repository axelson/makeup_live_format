import Config

config :makeup_live, MakeupLiveWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.fetch_env!("PORT"))]

defmodule MakeupLiveWeb.Router do
  use MakeupLiveWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MakeupLiveWeb do
    pipe_through :browser

    live "/",  FormatLive
  end
end

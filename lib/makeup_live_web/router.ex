defmodule MakeupLiveWeb.Router do
  use MakeupLiveWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :fetch_live_flash
    plug :protect_from_forgery
    # plug :put_secure_browser_headers, %{"permissions-policy" => "interest-cohort=()"}
    plug :put_root_layout, {MakeupLiveWeb.LayoutView, :root}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MakeupLiveWeb do
    pipe_through :browser

    live "/",  FormatLive
  end
end

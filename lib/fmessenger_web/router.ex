defmodule FmessengerWeb.Router do
  use FmessengerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_session do
    plug Fmessenger.Auth.Pipeline
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FmessengerWeb do
    pipe_through [:browser, :browser_session]

    get "/", PageController, :index

    get "/signup", PageController, :signup
    post "/signup", PageController, :create_user
    get "/login", PageController, :login
    post "/login", PageController, :login_user
    get "/logout", PageController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", FmessengerWeb do
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
      live_dashboard "/dashboard", metrics: FmessengerWeb.Telemetry
    end
  end
end

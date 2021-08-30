defmodule Fmessenger.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Fmessenger.Repo,
      # Start the Telemetry supervisor
      FmessengerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Fmessenger.PubSub},
      # Start the Endpoint (http/https)
      FmessengerWeb.Endpoint
      # Start a worker by calling: Fmessenger.Worker.start_link(arg)
      # {Fmessenger.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fmessenger.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FmessengerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

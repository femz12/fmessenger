# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fmessenger,
  ecto_repos: [Fmessenger.Repo]

# Configures the endpoint
config :fmessenger, FmessengerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tW2ap4XJDzO1oI65bGygtITs0BbWzfA00Eq+NeGhrv+Ta8HtBpwaRd3LDmzX95/5",
  render_errors: [view: FmessengerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Fmessenger.PubSub,
  live_view: [signing_salt: "4ba6Jl+3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :fmessenger, Fmessenger.Auth.Guardian,
  issuer: "Fmessenger",
  ttl: {30, :days},
  allowed_drift: 2000,
  secret_key: "Bi0aihxUhSTV/zEhmOWsHsnH6kMB/U8mwv9hjjcZ65Vnw/GkZpb4FrARi23JIXpF"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

defmodule Fmessenger.Repo do
  use Ecto.Repo,
    otp_app: :fmessenger,
    adapter: Ecto.Adapters.Postgres
end

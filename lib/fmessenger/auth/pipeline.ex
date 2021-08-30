defmodule Fmessenger.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :fmessenger,
    module: Fmessenger.Auth.Guardian

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.LoadResource, allow_blank: true
end

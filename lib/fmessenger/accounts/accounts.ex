defmodule Fmessenger.Accounts do
  import Ecto.Changeset

  alias Fmessenger.Repo
  alias Fmessenger.Accounts.User

  def create_user(params) do
    register_changeset(params)
    |> Repo.insert()
  end

  def register_changeset(params \\ %{}) do
    %User{}
    |> cast(params, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
  end
end

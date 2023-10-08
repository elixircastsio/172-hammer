defmodule Teacher.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :api_key, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:api_key])
    |> validate_required([:api_key])
  end
end

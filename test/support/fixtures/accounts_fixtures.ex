defmodule Teacher.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Teacher.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        api_key: "some api_key"
      })
      |> Teacher.Accounts.create_user()

    user
  end
end

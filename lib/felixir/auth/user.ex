defmodule Felixir.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :username, :password])
    |> validate_required([:name, :email, :username, :password])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> validate_length(:username, min: 4, max: 30)
    |> validate_length(:name, min: 8, max: 30)
    |> validate_length(:password, min: 8, max: 30)
  end
end

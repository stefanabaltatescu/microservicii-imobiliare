defmodule UserApi.Directory.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :email, :string
    field :firstName, :string
    field :lastName, :string
    field :password, :string
    field :telephone, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :lastName, :firstName, :email, :password, :telephone])
    |> validate_required([:username, :lastName, :firstName, :email, :password, :telephone])
  end
end

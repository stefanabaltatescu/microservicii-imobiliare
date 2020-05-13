defmodule UserApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :username, :string
      add :lastName, :string
      add :firstName, :string
      add :email, :string
      add :password, :string
      add :telephone, :string

      timestamps()
    end

  end
end

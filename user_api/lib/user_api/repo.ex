defmodule UserApi.Repo do
  use Ecto.Repo,
    otp_app: :user_api,
    adapter: Ecto.Adapters.Postgres

  def init(_, config) do
    config = config
             |> Keyword.put(:username, System.get_env("postgres"))
             |> Keyword.put(:password, System.get_env("admin"))
             |> Keyword.put(:database, System.get_env("user_api_dev"))
             |> Keyword.put(:hostname, System.get_env("localhost"))
             |> Keyword.put(:port, System.get_env("5432") |> String.to_integer)
    {:ok, config}
  end
end

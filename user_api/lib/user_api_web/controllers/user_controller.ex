defmodule UserApiWeb.UserController do
  use UserApiWeb, :controller

  alias UserApi.Directory
  alias UserApi.Directory.User

  action_fallback UserApiWeb.FallbackController

  def index(conn, _params) do
    user = Directory.list_user()
    render(conn, "index.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Directory.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Directory.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Directory.get_user!(id)

    with {:ok, %User{} = user} <- Directory.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Directory.get_user!(id)

    with {:ok, %User{}} <- Directory.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end

defmodule UserApiWeb.UserView do
  use UserApiWeb, :view
  alias UserApiWeb.UserView

  def render("index.json", %{user: user}) do
    %{data: render_many(user, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      lastName: user.lastName,
      firstName: user.firstName,
      email: user.email,
      password: user.password,
      telephone: user.telephone}
  end
end

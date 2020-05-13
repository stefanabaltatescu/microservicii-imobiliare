defmodule UserApi.DirectoryTest do
  use UserApi.DataCase

  alias UserApi.Directory

  describe "user" do
    alias UserApi.Directory.User

    @valid_attrs %{email: "some email", firstName: "some firstName", lastName: "some lastName", password: "some password", telephone: "some telephone", username: "some username"}
    @update_attrs %{email: "some updated email", firstName: "some updated firstName", lastName: "some updated lastName", password: "some updated password", telephone: "some updated telephone", username: "some updated username"}
    @invalid_attrs %{email: nil, firstName: nil, lastName: nil, password: nil, telephone: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_user()

      user
    end

    test "list_user/0 returns all user" do
      user = user_fixture()
      assert Directory.list_user() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Directory.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Directory.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.firstName == "some firstName"
      assert user.lastName == "some lastName"
      assert user.password == "some password"
      assert user.telephone == "some telephone"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Directory.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.firstName == "some updated firstName"
      assert user.lastName == "some updated lastName"
      assert user.password == "some updated password"
      assert user.telephone == "some updated telephone"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_user(user, @invalid_attrs)
      assert user == Directory.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Directory.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Directory.change_user(user)
    end
  end
end

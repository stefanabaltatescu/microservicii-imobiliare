# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     UserApi.Repo.insert!(%UserApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias UserApi.Repo
alias UserApi.Directory.User

Repo.insert! %User{username: "dorindan", lastName: "Dorin", firstName: "Gabudean", email: "gabudeandorin@yahoo.ro", password: "dorindan", telephone: "0740123456"}
Repo.insert! %User{username: "szidi", lastName: "Szidonia", firstName: "Szappanyos", email: "sz@yahoo.ro", password: "szidi", telephone: "0740123456"}
Repo.insert! %User{username: "stefi", lastName: "Stefana", firstName: "Baltatescu", email: "stefi@yahoo.ro", password: "stefi", telephone: "0740123456"}
Repo.insert! %User{username: "alex", lastName: "Alex", firstName: "Rusu", email: "alex@yahoo.ro", password: "alex", telephone: "0740123456"}

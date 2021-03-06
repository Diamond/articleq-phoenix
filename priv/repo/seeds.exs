# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Articleq.Repo.insert!(%Articleq.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Articleq.Repo
alias Articleq.User

User.changeset(%User{}, %{username: "test", email: "test@test.com", password: "test"})
|> Repo.insert!

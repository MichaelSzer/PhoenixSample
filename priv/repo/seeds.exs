# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixSample.Repo.insert!(%PhoenixSample.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
for title <- ["Gamer", "Rock Fan", "Computers Geek", "Coffee Lover", "Soccer Fan", "College Student", "Highschool Student"] do
  PhoenixSample.Manager.create_category(%{title: title})
end

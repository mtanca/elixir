
defmodule User do
  defstruct [:id, :name, :username, :password]
end

# mimic db access
defmodule Repo do
  def all(User) do
   [
      %User{id: 1, name: "Mark XXXXX", username: "mark", password: "elixir"},
      %User{id: 2, name: "Matt YYYY", username: "matt", password: "elixir"},
      %User{id: 3, name: "Osama AAAA", username: "osama", password: "elixir"},
      %User{id: 4, name: "Eugene BBBB", username: "eugene", password: "elixir"}
    ]
  end

  def all(_), do: []

  def full_names(user_list) do
    Enum.map!(user_list, fn(user) -> user.name end)
  end

  def last_names(full_names) do
    Enum.map!(full_names, fn(user) ->
      String.split(user) |> Enum.at(1) end)
  end

  def shortest_last_name(last_name) do
    Enum.min_by last_name, &String.length/1
  end
end

defmodule Main do
  def main(user) do
    all_users = Repo.all(user)

    all_users
    |> Repo.full_names
    |> Repo.last_names
    |> Repo.shortest_last_name
  end
end

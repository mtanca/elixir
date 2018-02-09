defmodule SpawnExample do
  def greet_user do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello, #{msg}!"}
        # recursive call to wait for next message
        greet_user()
    end
  end
end

defmodule Main do
  def main do
    pid = spawn(SpawnExample, :greet_user, [])
    send pid, {self(), "User 1"}
    receive do
      {:ok, message} ->
        IO.puts message
    end

    send pid, {self(), "User 2"}

    receive do
      {:ok, message} ->
        IO.puts message
    end
  end
end

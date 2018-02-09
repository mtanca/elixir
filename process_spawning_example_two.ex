defmodule SpawnExample do
  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n + 1
    end
  end

  def create_processes(number) do
    last = Enum.reduce 1..number, self(),
      fn(_, current_pid) ->
        # IO.puts "\nCurrent process..."
        new_pid = spawn(SpawnExample, :counter, [current_pid])
        # IO.puts "New process created..."
      end

    send last, 0 # send 0 to last pid to start counting
    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end
end

defmodule Main do
  def run(number) do
    IO.puts inspect :timer.tc(SpawnExample, :create_processes, [number])
  end
end

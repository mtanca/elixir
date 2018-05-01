defmodule ParallelExample do
  def pmap(list,function) do
    current_process = self()
    list
    |> Enum.map(fn(element) ->
      spawn_link fn -> send process, { self(), function.(element) } end end)
    |> Enum.map(fn(pid) ->
      receive do{^pid, result} -> result end end)
  end
end

# iex(1)> Parallel.pmap [1,2,3,4,5,6], fn(element) -> element * 2 end
# [2, 4, 6, 8, 10, 12]

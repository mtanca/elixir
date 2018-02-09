defmodule Sequence.Stash do
  use GenServer

  def start_link(current_state) do
    { :ok, pid } = GenServer.start_link(__MODULE__, current_state)
  end

  def save_value(pid, state) do
    GenServer.cast(pid, {:save_value, state})
  end

  def get_value(pid) do
    GenServer.call(pid, :get_value)
  end

  # GenServer implementation
  def handle_call(:get_value, _from, current_state) do
    { :reply, current_state, current_state }
  end

  def handle_cast({:save_value, new_state}, _current_state) do
    { :noreply, new_state }
  end
end

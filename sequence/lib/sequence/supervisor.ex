defmodule Sequence.Supervisor do
  use Supervisor

  def start_link(initial_state) do
    result = { :ok, supervisor_pid } = Supervisor.start_link(__MODULE__, [initial_state])
    start_workers(supervisor_pid, initial_state)
    # return :ok
    result
  end

  def start_workers(supervisor_pid, initial_state) do
    #start stash worker
    { :ok, stash } =
      Supervisor.start_child(supervisor_pid, worker(Sequence.Stash, [initial_state]))
    # start subsupervisor
    Supervisor.start_child(supervisor_pid, worker(Sequence.SubSupervisor, [stash]))
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end
end

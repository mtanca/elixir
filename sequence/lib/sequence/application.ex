defmodule Sequence.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    # children = [
      { :ok, _pid } = Sequence.Supervisor.start_link(123)
      # {Sequence.Worker, arg},
    # ]
  end
end

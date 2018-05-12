defmodule Dictionary.Application do
  use Application
  @moduledoc """
  This module is used to help Dictionary be as a Free Standing Application
  """

  def start(_type, _args) do
    # Inorder to use the worker; we need to import them from a supervisor library.
    import Supervisor.Spec

    children = [
      worker(Dictionary.WordList, [])
    ]
    # Our children are gonna be a list of worker processes
    # worker() is a helper that is used to specify it..

    options = [
      name: Dictionary.Supervisor, #gives the supervisor a name
      strategy: :one_for_one # how to restart the processes;
    ] # what it does is; each if the processes it monitors are independent ; if one dies; they only of them
    # then we restart only that one particular process..
    # strategy is what is used to restart the processes;

    # children are worker processes; we use a helper to specify it

    Supervisor.start_link(children, options)
    # this would start the child processes and monitor them
    # according to the options we setup..;
  end
end

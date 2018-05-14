defmodule Hangman.Application do
  use Application
  @moduledoc """
  This module is used to help Dictionary be as a Free Standing Application
  """

  def start(_type, _args) do
    # Inorder to use the worker; we need to import them from a supervisor library.
    import Supervisor.Spec

    children = [
      worker(Hangman.Server, [])
    ]
    # The worker in this case is going to be our Hangman Server

    options = [
      name: Hangman.Supervisor, #gives the supervisor a name
      strategy: :simple_one_for_one # how to restart the processes;
    ] # We want to create Hangman servers dynamically
    # So we want to start off with non running;
    # as clients connect; we are gonna connect more and more..
    # For Dictionary we use one to one because it's static i.e.,
    # It's one dictionary and it just sits there..
    # When we create a supervisor it does not start any children;
    # It just remembers the specification for the child that we give wrt the code - worker(Hangman.Server, [])
    # We can then later on specify Supervisor.start_child
    # It will then create a new supervised process underneath the Hangman.Supervisor
    # This is now convenient as we'll have many child processes as we want..
    # It's just that they will be still supervised/managed..
    # Also since it's a one for one, If anyone crashes; it doesn't affect the other ones at all..


    # children are worker processes; we use a helper to specify it

    Supervisor.start_link(children, options)
    # this would start the child processes and monitor them
    # according to the options we setup..;
  end
end

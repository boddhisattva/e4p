defmodule Dictionary.Application do
  use Application
  @moduledoc """
  This module is used to help Dictionary be as a Free Standing Application
  """

  def start(_type, _args) do
    Dictionary.WordList.start_link()
  end
end

defmodule Dictionary.Application do
  use Application # Elixir has a built in behavior for apps
  # the above sets some defaults for us..

  def start(_type, _args) do
    Dictionary.WordList.start_link()
  end
end

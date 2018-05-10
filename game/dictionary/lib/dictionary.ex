defmodule Dictionary do
  @moduledoc """
  Documentation for Dictionary.
  """

  @doc """
  Generate a random word from a text file(assets/words.txt) that serves as a dictionary

  ## Examples

      iex> Dictionary.start
["that", "this", "with", "from", "your", "have", "more", "will", "home",
 "about", "page", "search", "free", "other", "information", "time", "they",
 "site", "what", "which", "their", "news", "there", "only", "when", "contact",
 "here", "business", "also", "help", "view", "online", "first", "been", "would",
 "were", "services", "some", "these", "click", "like", "service", "than",
 "find", "price", "date", "back", "people", "list", "name", ...]

      iex> Dictionary.random_word(Dictionary.start)
      "truth"

  """
  alias Dictionary.WordList

  defdelegate start(), to: WordList, as: :word_list
  defdelegate random_word(word_list), to: WordList
end

defmodule Bob do
  def hey(input) do
    cond do
        String.strip(input) |> String.length == 0 -> "Fine. Be that way!"
        String.last(input) == "?" -> "Sure."
        String.upcase(input) == input && String.downcase(input) != input -> "Whoa, chill out!"
        true -> "Whatever."

    end
  end
end

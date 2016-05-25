defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
      |> String.split(" ")
      |> Enum.map(&String.upcase/1)
      |> Enum.map(&(String.first/1))
      |> Enum.reduce(&(&1 <> &2))
      |> String.reverse
  end
end

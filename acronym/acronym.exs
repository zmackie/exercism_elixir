defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/(\p{Lu})|\b(\w{1})/, string, capture: :first)
      |> List.flatten
      |> Enum.map(&String.upcase/1)
      |> Enum.reduce(&(&2 <> &1))
  end
end

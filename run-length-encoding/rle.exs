defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
      |> to_char_list
      |> each_chunk
      |> get_count
      |> to_string
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(.)/, string)
      |> Enum.map_join(fn[_,n,c]-> String.duplicate(c, String.to_integer n) end)
  end

  defp each_chunk(array) do
    Enum.chunk_by(array, &(&1))
  end
  defp get_count(letters) do
    Enum.flat_map(letters, fn (chunk) ->
     to_char_list(length(chunk)) ++ [hd(chunk)]
    end)
  end
end

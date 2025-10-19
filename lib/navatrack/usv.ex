defmodule USV do
  def read!(path, drop = 0) do
    File.read!(path)
    |> String.splitter("␞")
    |> Enum.drop(drop)
    |> Stream.map(fn record ->
      record
      |> String.splitter("␟")
      |> Enum.drop(-1)
      |> Enum.to_list()
      |> Enum.map(&String.trim/1)
    end)
  end
end

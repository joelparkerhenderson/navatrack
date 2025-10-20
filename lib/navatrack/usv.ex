defmodule USV do

  def read!(path, drop \\ 0) do
    path
    |> File.read!()
    |> String.split("␞") # split on record separator
    |> Enum.drop(-1) # drop last element which is empty
    |> Enum.drop(drop) # drop any header records
    |> Enum.map(fn record ->
      record
      |> String.split("␟") # split on unit separator
      |> Enum.drop(-1) # drop last element which is empty
      |> Enum.map(&String.trim/1) # clean up whitespace
    end)
  end

end

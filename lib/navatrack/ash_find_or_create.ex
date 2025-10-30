defmodule AshFindOrCreate do

  def ash_find_or_create(resource, query, create_attrs) do
    case Ash.read_one(query) do
      {:ok, nil} ->
        resource
        |> Ash.Changeset.for_create(:create, create_attrs)
        |> Ash.create!()
      {:ok, record} ->
        record
      {:error, error} ->
        IO.inspect(error)
        raise "Error AshFindOrCreate.ash_find_or_create #{inspect(resource)}"
    end
  end

end

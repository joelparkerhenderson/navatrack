# Fab

We like to create fabricators (a.k.a. fabs) for various test data.

Our preferred way to create fabricators for this project is to define functions in each Ash resource, such as User and Plan.

The functions are:

```elixir
@doc """
Fabricate this resource. This means creating it and any required dependencies.
"""

def fab!(map \\ %{}) do
__MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
end

@doc """
Fabricate this resource as a map. This means suitable as a changeset.
"""

def fab_map(map \\ %{}) do
  Map.merge(
    %{
      locale_code: "en-US",
      parent_id: nil,
      parent_order: nil,
      name: "my-name",
      sign: "○",
      status: "my-status",
      tagging: "my-tagging",
      note: "my-note",
    },
    map
  )
end
```

For a resource that has a relationship, the function creates it if needed:

```elixir
def fab!(map \\ %{}) do
  map = Map.put_new_lazy(map, :foo_id, fn -> Foo.fab!().id end)
  x = __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
  IO.inspect(x)
  x
end
```

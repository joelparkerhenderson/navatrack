# Ash Changeset manage_relationship

Suppose you have a resource `R` such as a join table.

- The resource `R` belongs to Foo and belongs to Goo.

- The implementation is via `foo_id` and via `goo_id`.

When you create a resource, here's how to relate Foo and Goo:

```elixir
foo =
    MyApp.MyDomain.Foo
    |> Ash.Changeset.for_create(:create, %{
    name: "My Foo"
    })
    |> Ash.create!()

goo =
    MyApp.MyDomain.Foo
    |> Ash.Changeset.for_create(:create, %{
    name: "My Goo"
    })
    |> Ash.create!()

{:ok, _x} =
    X
    |> Ash.Changeset.for_create(:create, %{})
    |> Ash.Changeset.manage_relationship(:foo, foo, type: :append_and_remove)
    |> Ash.Changeset.manage_relationship(:goo, goo, type: :append_and_remove)
    |> Ash.create(authorize?: false)
```

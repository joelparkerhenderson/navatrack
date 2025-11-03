defmodule Navatrack.Accounts.AccessAssignment.Fab do
  defmacro __using__(_opts) do
    quote do

      def fab!(map \\ %{}) do
        map = Map.put_new_lazy(map, :user_id, fn -> Navatrack.Accounts.User.fab!().id end)
        map = Map.put_new_lazy(map, :access_attribute_id, fn -> Navatrack.Accounts.AccessAttribute.fab!().id end)
        x = __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
        x
      end

      def fab_map(map \\ %{}) do
        Map.merge(
          %{},
          map
        )
      end

    end
  end
end

defmodule Navatrack.Accounts.AccessPermission.Fab do
  defmacro __using__(_opts) do
    quote do

      def fab!(map \\ %{}) do
        map = Map.put_new_lazy(map, :access_attribute_id, fn -> Navatrack.Accounts.AccessAttribute.fab!().id end)
        map = Map.put_new_lazy(map, :access_operation_id, fn -> Navatrack.Accounts.AccessOperation.fab!().id end)
        __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
      end

      def fab_map(map \\ %{}) do
        Map.merge(
          %{
            access_attribute_id: nil,
            access_operation_id: nil,
          },
          map
        )
      end

    end
  end
end

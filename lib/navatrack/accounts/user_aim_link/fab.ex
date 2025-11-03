defmodule Navatrack.Accounts.UserAimLink.Fab do
  defmacro __using__(_opts) do
    quote do

      def fab!(map \\ %{}) do
        map = Map.put_new_lazy(map, :user_id, fn -> Navatrack.Accounts.User.fab!().id end)
        map = Map.put_new_lazy(map, :aim_id, fn -> Navatrack.Works.Aim.fab!().id end)
        __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
      end

      def fab_map(map \\ %{}) do
        Map.merge(%{}, map)
      end

    end
  end
end

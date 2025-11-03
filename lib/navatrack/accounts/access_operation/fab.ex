defmodule Navatrack.Accounts.AccessOperation.Fab do
  defmacro __using__(_opts) do
    quote do

      def fab!(map \\ %{}) do
        __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
      end

      def fab_map(map \\ %{}) do
        Map.merge(
          %{
            locale_code: "en-US",
            name: "my-name",
            sign: "○",
            status: "my-status",
            tagging: "my-tagging",
            note: "my-note"
          },
          map
        )
      end

    end
  end
end

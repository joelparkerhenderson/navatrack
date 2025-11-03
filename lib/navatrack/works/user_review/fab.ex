defmodule Navatrack.Works.UserReview.Fab do
  defmacro __using__(_opts) do
    quote do

      def fab!(map \\ %{}) do
        map = Map.put_new_lazy(map, :by_user_id, fn -> Navatrack.Accounts.User.fab!().id end)
        map = Map.put_new_lazy(map, :to_user_id, fn -> Navatrack.Accounts.User.fab!().id end)
        __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
      end

      def fab_map(map \\ %{}) do
        Map.merge(
          %{
            ### meta
            locale_code: "en-US",
            parent_id: nil,
            parent_order: nil,
            ### card
            name: "my-name",
            sign: "○",
            status: "my-status",
            tagging: "my-tagging",
            note: "my-note",
            ### relationships

            by_user_id: nil,
            to_user_id: nil,
            ### content
            strength: "my-strength",
            start: "my-start",
            stop: "my-stop",
            continue: "my-continue",
            change: "my-change",
            advice: "my-advice"
          },
          map
        )
      end

    end
  end
end
